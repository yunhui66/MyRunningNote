//
//  AssociationInfoViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit
import SnapKit

class AssociationInfoViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var tableData = [["title":"身高","detail":"175cm"], ["title":"体重","detail":"67.5kg"], ["title":"腰围","detail":"45cm"],["title":"体脂率","detail":"10.5"],["title":"BMI","detail":"28.4"]]
    var headerView = AssociationInfoView()
    var segIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //防止push时页面出现时有短暂的卡顿
        self.view.backgroundColor = UIColor.white
        
        self.title = "协会名称"
        self.customNaviBackButton()
        self.initHeaderView()
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
        //方式一：跳转到前一个页面
        self.navigationController?.popViewController(animated: true)
    }

    func initHeaderView() {
        //设置头部视图
        headerView = AssociationInfoView.init(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT/5))
        //headerView.backgroundColor = UIColor.orange
        self.view.addSubview(headerView)
        
        
        headerView.segmentController.addTarget(self, action: #selector(initFootView), for: .valueChanged)
        headerView.segmentController.selectedSegmentIndex = 0
        self.initDynamicationView()
    }
    
    @objc func initFootView(seg:UISegmentedControl) {
        print("选择了\(seg.selectedSegmentIndex)")
        switch seg.selectedSegmentIndex {
        case 0:
            self.initDynamicationView()
        case 1:
            self.initMemberView()
        case 2:
            self.initIntroductionView()
        default:
            print("选择了\(seg.selectedSegmentIndex)")
        }
    }
    
    func initDynamicationView() {
        let headerViewHight = headerView.frame.size.height
        //创建表视图
        let tableView = UITableView(frame: CGRect(x: 0, y: SCREEN_HEIGHT/5 + 80, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - headerViewHight), style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "DynamicationTableCell", bundle: nil), forCellReuseIdentifier: "DynamicationViewCell")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        //设置表格背景色
        tableView.backgroundColor = UIColor.white
        //去除单元格分隔线
        tableView.separatorStyle = .none
        //设置表格头部视图
        let blankView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.1))
        tableView.tableHeaderView = blankView
    }
    
    func initMemberView() {
        let headerViewHight = headerView.frame.size.height
        //创建表视图
        let tableView = UITableView(frame: CGRect(x: 0, y: SCREEN_HEIGHT/5 + 80, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - headerViewHight), style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "MemberViewCell", bundle: nil), forCellReuseIdentifier: "MemberViewCell")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        //设置表格背景色
        tableView.backgroundColor = UIColor.white
        //去除单元格分隔线
        tableView.separatorStyle = .singleLine
        //设置表格头部视图
        let blankView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.1))
        tableView.tableHeaderView = blankView
    }
    
    func initIntroductionView() {
        let headerViewHight = headerView.frame.size.height
        let introductionView = UIView(frame: CGRect(x: 0, y: SCREEN_HEIGHT/5 + 80, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - headerViewHight))
        introductionView.backgroundColor = UIColor.lightGray
        self.view.addSubview(introductionView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = headerView.segmentController.selectedSegmentIndex
        if index == 0 {
            return 168
        }else if index == 1{
            return 80
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = headerView.segmentController.selectedSegmentIndex
        if index == 0 {
            //获取载体cell
            let cell:DynamicationTableCell = tableView.dequeueReusableCell(withIdentifier: "DynamicationViewCell", for: indexPath) as! DynamicationTableCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //使用数据模型中信息对cell进行设置
            //let item = tableData[indexPath.row]
            cell.timeLabel.text = "2018-5-25"
            cell.contentText.text = "开发者可以在应用第一次启动时调用一 次，然后将该串存储起来，以便以后替代UDID来使用。但是，如果用户删除该应用再次安装时，又会生成新的字符串，所以不能保证唯一识别该设备。这就需要各路高手想出各种解决方案。"
            return cell
        }else if index == 1{
            //获取载体cell
            let cell:MemberViewCell = tableView.dequeueReusableCell(withIdentifier: "MemberViewCell", for: indexPath) as! MemberViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //使用数据模型中信息对cell进行设置
            //let item = tableData[indexPath.row]
            cell.nameLabel.text = "程可欣"
            cell.classLabel.text = "计算机学院 | 16级1班"
            return cell
        }else{
            //获取载体cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicationViewCell", for: indexPath) as! DynamicationTableCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //使用数据模型中信息对cell进行设置
            //let item = tableData[indexPath.row]
            cell.timeLabel.text = "2018-5-25"
            cell.contentText.text = "开发者可以在应用第一次启动时调用一 次，然后将该串存储起来，以便以后替代UDID来使用。但是，如果用户删除该应用再次安装时，又会生成新的字符串，所以不能保证唯一识别该设备。这就需要各路高手想出各种解决方案。"
            return cell
        }
    }
}
