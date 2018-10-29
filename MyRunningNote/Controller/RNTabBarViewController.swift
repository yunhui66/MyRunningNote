//
//  RNTabBarViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RNTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //首页
        let homeVC = RunningViewController();
        self.addChildViewController(childerVC: homeVC, title:"运动", normalImg: "icon_running_unselect", selectedImg: "icon_running_selected");
        //嘉宝箱
        let treasureBoxVC = CompetitionViewController()
        self.addChildViewController(childerVC: treasureBoxVC, title: "赛事", normalImg: "icon_competition_unselect", selectedImg: "icon_competition_selected")

        //我嘉
        let myShowVC = StadiumViewController()
        self.addChildViewController(childerVC: myShowVC, title: "场馆", normalImg: "icon_stadium_unselect", selectedImg: "icon_stadium_selected")

        //会员中心
        let memberCenterVc = MineViewController()
        self.addChildViewController(childerVC: memberCenterVc, title: "我", normalImg: "icon_mine_unselect", selectedImg: "icon_mine_selected")
        
        self.selectedIndex = 0

    }

    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        //底部tabbar字体颜色
        let color = RGB(r: 14, g: 147, b: 46)
        self.tabBar.tintColor = color
        
        childerVC.title = title as String
        //底部tabbar非选中时背景图片
        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //底部tabbar选中时背景图片
        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        
        //导航NaviController设置
        let naviController = RNNaviViewController()
        naviController.tabBarItem = tabItem
        naviController.addChildViewController(childerVC)
        self.addChildViewController(naviController)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
