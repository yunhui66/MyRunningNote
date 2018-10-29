//
//  CompetitionViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class CompetitionViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var tableData = [["time":"2018年5月25号", "title":"西南科技大学夏季运动会", "progress":"比赛进行中", "progress_mark":"competition_start"]]
    let _SettedCountDown:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTableView()
    }

    func initTableView() {
        //创建表视图
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "CompetitionTableCell", bundle: nil), forCellReuseIdentifier: "CompetitionViewCell")
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
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 10))        
        tableView.tableHeaderView = headerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("\(indexPath)")
        //获取载体cell
        let cell:CompetitionTableCell = tableView.dequeueReusableCell(withIdentifier: "CompetitionViewCell", for: indexPath) as! CompetitionTableCell
        //cell.layer.cornerRadius = 10
        //使用数据模型中信息对cell进行设置
        let item = tableData[0]
        cell.competitionTime.text = item["time"]
        cell.competitionName.text = item["title"]
        cell.competitionProgress.text = item["progress"]
        cell.imgProgress.image = UIImage(named:item["progress_mark"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //表格点击抬起后颜色恢复
        //[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            self.hidesBottomBarWhenPushed = true;
            //实例化一个将要跳转的viewController
            let competitionInfo = CompetitionInfoViewController()
            //跳转
            self.navigationController?.pushViewController(competitionInfo , animated: true)
            //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
            self.hidesBottomBarWhenPushed = false;
        }else if indexPath.row == 1{
            
            //左右按钮+文字提示
            UIAlertController.alert(title: "提示", message: "内容", cancelButtonTitle: "取消", otherButtons: ["确定","插入"], dismiss: { (btnIndex) in
                print("\(btnIndex)")
            }, cancel: {
                print("cancelClicked")
            })
            
//            //上下按钮+文字提示
//            UIAlertController.alertSheet(title: "提示", message: "内容", buttons: ["确定"], dismiss: { (btnIndex) in
//                print("\(btnIndex)")
//            }, cancel: {
//                print("cancelClicked")
//            })
        }else if indexPath.row == 2{
            //MBProgressHUD.showInfo("提示......")
            //MBProgressHUD.showError("错误.....")
            MBProgressHUD.showSuccess("成功")
            //MBProgressHUD.showWait("等待")
        }else if indexPath.row == 3{

        }else if indexPath.row == 4{
            //self.countDown(count: 5)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
//    func countDown(count:Int) {
//        if count <= 0 {
//            return;
//        }
//        let lblCountDown = UILabel(frame: CGRect(x:SCREEN_WIDTH / 3 , y: SCREEN_HEIGHT / 3, width: SCREEN_WIDTH / 3, height: SCREEN_WIDTH / 3))
//        lblCountDown.textColor = UIColor.red
//        lblCountDown.font = UIFont.systemFont(ofSize: 128)
//        //lblCountDown.adjustsFontForContentSizeCategory = true
//        lblCountDown.backgroundColor = UIColor.clear
//        lblCountDown.text = String(format: "%d", count)
//        self.view.addSubview(lblCountDown)
//
//        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .overrideInheritedOptions, animations: {
//            lblCountDown.alpha = 0
//            lblCountDown.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
//        }) { (finished : Bool) in
//            lblCountDown.removeFromSuperview()
//            self.countDown(count: count - 1)
//        }
//    }

}
