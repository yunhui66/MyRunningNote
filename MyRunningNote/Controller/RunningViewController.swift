//
//  RunningViewController.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit
import SnapKit

class RunningViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavigationItem(imageName: "run_record", left: true)
        
        self.initNavigationItem(imageName: "run_single_train", left: false)
        
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    
    func initView() {
        let runView = RunningPageView.init()
        self.view.addSubview(runView)
        //NSLog("labelwidth = %d", runView.titlelab.frame.width)
        runView.snp.makeConstraints { (make) in
            make.top.equalTo(NAVI_STATUS_HIGHT)
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(SCREEN_HEIGHT - CGFloat.init(NAVI_STATUS_HIGHT))
        }
        //runView.backgroundColor = UIColor.gray
        runView.runningBtn.addTarget(self, action: #selector(runningStartTouch), for: .touchUpInside)
    }
    
    @objc func runningStartTouch() {
        self.hidesBottomBarWhenPushed = true;
        //实例化一个将要跳转的viewController
        let mapViewVC = MapViewController()
        //跳转
        self.navigationController?.pushViewController(mapViewVC , animated: true)
        //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
        self.hidesBottomBarWhenPushed = false;
    }
}
