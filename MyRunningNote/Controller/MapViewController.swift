//
//  MapViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/25.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MAMapViewDelegate,AMapLocationManagerDelegate{
    
    var mapView:MAMapView = MAMapView()
    var locationManage:AMapLocationManager = AMapLocationManager()
    var headerView = MapHeaderView()
    var footerView = MapFooterView()
    
    var coordinateArray: [CLLocationCoordinate2D] = []
    var AvaiblePoints:Int = 0
    var currentLocation:CLLocation?
    var distance:Double = 0
    var seconds:Int = 0
    var annotations = NSMutableArray.init();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.navigationBar.isHidden = true
        self.customNaviBackButton()
        
        self.initMapView()
        
        headerView = MapHeaderView.init(frame: CGRect(x: 0, y: NAVI_STATUS_HIGHT, width: SCREEN_WIDTH, height: 72))
        headerView.backgroundColor = UIColor.lightText
        self.view.addSubview(headerView)

        footerView = MapFooterView.init(frame: CGRect(x: 0, y: SCREEN_HEIGHT-96, width: SCREEN_WIDTH, height: 96))
        footerView.backgroundColor = UIColor.lightText
        self.view.addSubview(footerView)

        footerView.startBtn.addTarget(self, action: #selector(startRunning), for: .touchUpInside)
        footerView.stopBtn.addTarget(self, action: #selector(stopRunning), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.startLocation()
    }
    
    func startLocation()
    {
        // 开始定位
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.pausesLocationUpdatesAutomatically = false
        mapView.allowsBackgroundLocationUpdates = true
    }
    
    func endLocation(){
        // 定位结束
        mapView.showsUserLocation = false
    }
    
    //开始跑步按钮响应
    @objc func startRunning() {
        print("开始跑步")
    }
    
    //停止跑步按钮响应
    @objc func stopRunning() {
        print("停止跑步")
        self.endLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化地图界面
    func initMapView() {
        
        //初始化地图
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.zoomLevel = 15.5
        mapView.distanceFilter = 3.0
        self.view.addSubview(mapView)
        
    }

    //自定义导航栏返回按钮样式
    func customNaviBackButton() {
        // 返回按钮
        let backButton = UIButton(type: .custom)
        
        // 给按钮设置返回箭头图片
        backButton.setImage(UIImage(named:"icon_backHome"), for: .normal)
        backButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        // 设置frame
        backButton.frame = CGRect(x: 0, y: 6, width: 40, height: 30)
        backButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        backButton.setTitle("返回", for: .normal)
        
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let backView = UIBarButtonItem(customView: backButton)
        
        // 重要方法，用来调整自定义返回view距离左边的距离
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = -5
        
        // 返回按钮设置成功
        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }
    
    //导航栏返回按钮响应
    @objc func backToPrevious() {
        //print("返回")
        self.navigationController?.popViewController(animated:true)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode!) {
        if location.horizontalAccuracy < kCLLocationAccuracyNearestTenMeters*3 && location.horizontalAccuracy > 0 {
            print("定位成功，精度小于30")
        }else{
            print("定位失败")
        }
    }
    
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        // 地图每次有位置更新时的回调
        
        if updatingLocation {
            // 获取新的定位数据
            let coordinate = userLocation.coordinate
            
            // 添加到保存定位点的数组
            self.coordinateArray.append(coordinate)
            
            updatePath()
        }
    }

    func updatePath () {    
        // 每次获取到新的定位点重新绘制路径
        // 移除掉除之前的overlay
        let overlays = self.mapView.overlays
        self.mapView.removeOverlays(overlays)
    
        let polyline = MAPolyline(coordinates: &self.coordinateArray, count: UInt(self.coordinateArray.count))
            self.mapView.add(polyline)
    
        // 将最新的点定位到界面正中间显示
        let lastCoord = self.coordinateArray[self.coordinateArray.count - 1]
        self.mapView.setCenter(lastCoord, animated: true)
    }
    
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay.isKind(of: MAPolyline.self) {
            let renderer: MAPolylineRenderer = MAPolylineRenderer(overlay: overlay)
            renderer.lineWidth = 6.0
            renderer.strokeColor = UIColor(red: 4 / 255.0, green:  181 / 255.0, blue:  108 / 255.0, alpha: 1.0)
            
            return renderer
        }
        return nil
    }
    
    //更新界面跑步距离
    func updateDistance(dis:Double){
        self.distance += dis
        headerView.distanceLabel.text = String(format: "%.2f", distance/1000)
    }
    
    //更新界面跑步速度
    func updateSpeed(loc:MAUserLocation){
        var speed = Double(loc.location.speed)
        if speed < 0 {
            speed = 0
        }
        headerView.speedLabel.text = String(format: "%.2f", speed)
    }
    
    //更新界面跑步时间
    func updateTime(){
        let min = seconds / 60;
        let hour = min / 60;
        headerView.timeLabel.text = String(format: "%d:%d:%d",hour%24,min%60,seconds%60)
    }
    
    func mapView(_ mapView: MAMapView!, didDeselect view: MAAnnotationView!) {
        print("//////")
        //左右按钮+文字提示
        UIAlertController.alert(title: "提示", message: "是否从地图中移除该标记点？", cancelButtonTitle: "取消", otherButtons: ["确定"], dismiss: { (btnIndex) in
            print("\(btnIndex)")
        }, cancel: {
            print("cancelClicked")
        })
    }
}

