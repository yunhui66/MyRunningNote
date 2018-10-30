//
//  RunningViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RunningViewController: UIViewController {

    var runView:RunningPageView!
    var viewModel:RunningViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNavigationItem(imageName: "run_record", left: true)
        self.initNavigationItem(imageName: "run_single_train", left: false)
        viewModel = RunningViewModel()
        self.setupSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //设置导航栏左右两边的图片按钮
    func initNavigationItem(imageName:NSString, left:Bool) {
        
        let image = UIImage(named: imageName as String)
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        let btnItem = UIBarButtonItem(customView: button)
        if left {
            self.navigationItem.leftBarButtonItem = btnItem
        }else{
            self.navigationItem.rightBarButtonItem = btnItem
        }
        
    }
    
    func setupSubviews() {
        runView = RunningPageView.init(frame: CGRect(x: 0, y: NAVI_STATUS_HIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-NAVI_STATUS_HIGHT))
        self.view.addSubview(runView)
        //开始跑步按钮添加监听事件
        runView.runningBtn.addTarget(self, action: #selector(runningStartAction(sender:)), for: .touchUpInside)
    }
    
    //开始跑步按钮响应事件
    @objc func runningStartAction(sender: UIButton) {
        viewModel.runningStartAction(controller: self)
    }
}
