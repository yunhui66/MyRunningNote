//
//  AppointmentRecordViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class AppointmentRecordViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableData = [["time":"2018/8/24 14:30 ~ 15:30","place":"篮球场 5 号场地","status":"因故取消"], ["time":"2018/8/25 15:30 ~ 16:30","place":"篮球场 5 号场地","status":"因故取消"], ["time":"2018/8/26 14:30 ~ 15:30","place":"篮球场 5 号场地","status":"¥12"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "预约记录"
        self.customNaviBackButton()
        
        self.initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @objc func backToPrevious() {
        //print("返回")
        self.navigationController?.popToRootViewController(animated:true)
    }
    
    func initTableView() {
        //创建表视图
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "AppointmentRecordViewCell", bundle: nil), forCellReuseIdentifier: "ApppointmentRecordCellId")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        //设置表格背景色
        tableView.backgroundColor = UIColor.white
        //设置分割线内边距
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        //去除单元格分隔线
        tableView.separatorStyle = .none
        //禁止上下滚动
        tableView.isScrollEnabled = false;
        //设置表格头部视图
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.1))
        tableView.tableHeaderView = headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取载体cell
        let cell:AppointmentRecordViewCell = tableView.dequeueReusableCell(withIdentifier: "ApppointmentRecordCellId", for: indexPath) as! AppointmentRecordViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        //使用数据模型中信息对cell进行设置
        let item = tableData[indexPath.row]
        cell.timeLab.text = item["time"]
        cell.placeLab.text = item["place"]
        cell.statusLab.text = item["status"]
        return cell
    }
    
}
