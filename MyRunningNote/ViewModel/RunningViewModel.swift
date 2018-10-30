//
//  RunningViewModel.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/30.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RunningViewModel: NSObject {

    //开始跑步按钮响应事件
    func runningStartAction(controller: UIViewController){
        controller.hidesBottomBarWhenPushed = true;
        //实例化一个将要跳转的viewController
        let mapViewVC = MapViewController()
        //跳转
        controller.navigationController?.pushViewController(mapViewVC , animated: true)
        //最后一句话，可以保证在back回到A时，tabBar会恢复正常显示
        controller.hidesBottomBarWhenPushed = false;
    }
}
