//
//  RNNaviViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RNNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置状态栏字体颜色为黑色
        UIApplication.shared.statusBarStyle = .lightContent
        //修改导航栏背景色
        self.navigationBar.barTintColor = RGB(r: 14, g: 147, b: 46)
        
        //修改导航栏文字颜色
        self.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
