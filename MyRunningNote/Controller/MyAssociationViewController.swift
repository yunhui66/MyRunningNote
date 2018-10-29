//
//  MyAssociationViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class MyAssociationViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    var tableData = [["associaion":"计算机协会","class":"所属院系：计算机学院  成员：390","info":"3"], ["associaion":"羽毛球协会","class":"所属院系：计算机学院  成员：390","info":"1"],["associaion":"梅西粉丝协会","class":"所属院系：艺术学院  成员：390","info":"15"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的协会"
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
        
        let backView = UIBarButtonItem(customView: backButton)
        
        // 重要方法，用来调整自定义返回view距离左边的距离
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = -5
        
        // 返回按钮设置成功
        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }
    
    @objc func backToPrevious() {
        //跳转到前一个页面
        self.navigationController?.popViewController(animated: true)
    }
    
    func initTableView() {
        //创建表视图
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "MyAssociationViewCell", bundle: nil), forCellReuseIdentifier: "MyAssociationCellId")
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
        let headerView = NoAssociationView.init(frame: CGRect(x: 64, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT/5))
        self.view.addSubview(headerView)
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
        let cell:MyAssociationViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAssociationCellId", for: indexPath) as! MyAssociationViewCell
        //使用数据模型中信息对cell进行设置
        let item = tableData[indexPath.row]
        cell.associationLab.text = item["associaion"]
        cell.classLab.text = item["class"]
        cell.infoLab.text = item["info"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        //表格点击抬起后颜色恢复
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            self.hidesBottomBarWhenPushed = true;
            //实例化一个将要跳转的viewController
            let associationInfoVC = AssociationInfoViewController()
            //跳转
            self.navigationController?.pushViewController(associationInfoVC , animated: true)
            //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
            self.hidesBottomBarWhenPushed = true;
        default:
            NSLog("row = %d", indexPath.row)
        }
    }
    
}
