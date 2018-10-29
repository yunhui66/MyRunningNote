//
//  MineViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableData = [["title":"身体指数"], ["title":"运动记录"], ["title":"预约记录"], ["title":"我的赛事"],["title":"我的协会"],["title":"指导老师"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTableView()
        
    }

    func initTableView() {
        //创建表视图
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        //注册cell
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "UITableViewCellId")
        //tableView.register(UINib.init(nibName: "UITableViewCell", bundle: nil), forCellReuseIdentifier: "UITableViewCellId")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        
        let headerView = MineHeaderView.init(frame: CGRect(x: 64, y: 0, width: SCREEN_WIDTH, height: 110))
        //headerView.backgroundColor = UIColor.orange
        self.view.addSubview(headerView)
        tableView.tableHeaderView = headerView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取载体cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellId", for: indexPath)
        //cell.layer.cornerRadius = 10
        //使用数据模型中信息对cell进行设置
        let item = tableData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = item["title"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //表格点击抬起后颜色恢复
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            self.hidesBottomBarWhenPushed = true;
            //实例化一个将要跳转的viewController
            let bodyIndexVC = BodyIndexViewController()
            //跳转
            self.navigationController?.pushViewController(bodyIndexVC , animated: true)
            //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
            self.hidesBottomBarWhenPushed = false;
            
        case 2:
            self.hidesBottomBarWhenPushed = true;
            //实例化一个将要跳转的viewController
            let appointmentRecordVC = AppointmentRecordViewController()
            //跳转
            self.navigationController?.pushViewController(appointmentRecordVC , animated: true)
            self.hidesBottomBarWhenPushed = false;
        //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
        case 4:
            self.hidesBottomBarWhenPushed = true;
            //实例化一个将要跳转的viewController
            let myAssociationVC = MyAssociationViewController()
            //跳转
            self.navigationController?.pushViewController(myAssociationVC , animated: true)
            self.hidesBottomBarWhenPushed = false;
        //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
        default:
            NSLog("index.row = %d", indexPath.row)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
