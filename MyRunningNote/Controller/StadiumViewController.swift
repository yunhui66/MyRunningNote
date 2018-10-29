//
//  StadiumViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class StadiumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableData = [["time":"今天 14:30 ~ 15:30","place":"篮球场5号场地"], ["time":"今天 14:30 ~ 15:30","place":"篮球场5号场地"], ["time":"今天 14:30 ~ 15:30","place":"篮球场5号场地"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initTableView() {
        //创建表视图
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "StadiumViewCell", bundle: nil), forCellReuseIdentifier: "StadiumViewCell")
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
        
        let headerView = StadiumHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 278))
        //view.backgroundColor = UIColor.orange
        tableView.tableHeaderView = headerView
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取载体cell
        let cell:StadiumViewCell = tableView.dequeueReusableCell(withIdentifier: "StadiumViewCell", for: indexPath) as! StadiumViewCell
        //使用数据模型中信息对cell进行设置
        let item = tableData[indexPath.row]
        cell.stadiumTime.text = item["time"]
        cell.stadiumPlace.text = item["place"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        //表格点击抬起后颜色恢复
        //[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}
