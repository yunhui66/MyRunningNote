//
//  RunningMapView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/25.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class MapFooterView: UIView {

    var startBtn:ImageTextButton = ImageTextButton()
    var stopBtn:ImageTextButton = ImageTextButton()
    
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStartButton()
        self.setupStopButton()
    }

    func setupStartButton() {
        /// 样式一: 图片在上 文字在下
        startBtn = ImageTextButton(font: UIFont.systemFont(ofSize: 16), textColor: .black, spacing: 5, imageName: "running_start_1", imageSize: CGSize(width: 40, height: 40), title: "开始", aligment: .center)

        startBtn.frame = CGRect(x: SCREEN_WIDTH/8 , y: 0, width: SCREEN_WIDTH/4, height: 96)
        startBtn.backgroundColor = UIColor.lightText
        self.addSubview(startBtn)
    }
    
    func setupStopButton() {
        /// 样式一: 图片在上 文字在下
        stopBtn = ImageTextButton(font: UIFont.systemFont(ofSize: 16), textColor: .black, spacing: 5, imageName: "running_stop_1", imageSize: CGSize(width: 40, height: 40), title: "停止", aligment: .center)
        
        stopBtn.frame = CGRect(x: SCREEN_WIDTH*5/8 , y: 0, width: SCREEN_WIDTH/4, height: 96)
        stopBtn.backgroundColor = UIColor.clear
        self.addSubview(stopBtn)
    }
}
