//
//  BodyIndexViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class BodyIndexViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    var tableData = [["title":"身高","detail":"175cm"], ["title":"体重","detail":"67.5kg"], ["title":"腰围","detail":"45cm"],["title":"体脂率","detail":"10.5"],["title":"BMI","detail":"28.4"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "身体指数"
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
        tableView.register(UINib.init(nibName: "BodyIndexViewCell", bundle: nil), forCellReuseIdentifier: "BodyIndexCellId")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        //设置表格背景色
        tableView.backgroundColor = UIColor.white
        //设置分割线内边距
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        //去除单元格分隔线
        tableView.separatorStyle = .singleLine
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
        return 5;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取载体cell
        let cell:BodyIndexViewCell = tableView.dequeueReusableCell(withIdentifier: "BodyIndexCellId", for: indexPath) as! BodyIndexViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        //使用数据模型中信息对cell进行设置
        let item = tableData[indexPath.row]
        cell.titleLab.text = item["title"]
        cell.detailLab.text = item["detail"]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row)")
//        //表格点击抬起后颜色恢复
//        //[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
}
