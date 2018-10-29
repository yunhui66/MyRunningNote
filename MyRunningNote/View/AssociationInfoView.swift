//
//  AssociationInfoView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class AssociationInfoView: UIView {

    var leaderLab : UILabel = UILabel()
    var leaderLabel : UILabel = UILabel()
    
    var mumberLab : UILabel = UILabel()
    var mumberLabel : UILabel = UILabel()
    
    var establishTimeLab : UILabel = UILabel()
    var establishTimeLabel : UILabel = UILabel()
    
    var segmentController :UISegmentedControl = UISegmentedControl()
    
    var separationLine : UIView = UIView()

    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLeaderLab()
        self.setupLeaderLabel()
        
        self.setupMumberLab()
        self.setupMumberLabel()
        
        self.setupEstablishTimeLab()
        self.setupEstablishTimeLabel()
        
        self.setupSegmentController()
        self.setupSeparationLine()
    }
    
    func setupLeaderLab() {
        leaderLab = UILabel.init()
        self.addSubview(leaderLab)
        leaderLab.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 4)
        }
        leaderLab.text = "负责人"
        leaderLab.textAlignment = .center
        leaderLab.font = UIFont.boldSystemFont(ofSize: 15)
        leaderLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupLeaderLabel() {
        leaderLabel = UILabel.init()
        self.addSubview(leaderLabel)
        leaderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(leaderLab.snp.bottom).offset(8)
            make.left.equalTo(20)
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 4)
        }
        leaderLabel.text = "程可欣"
        leaderLabel.textAlignment = .center
        leaderLabel.textColor = UIColor.orange
        leaderLabel.font = UIFont.boldSystemFont(ofSize: 15)
        leaderLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupMumberLab() {
        mumberLab = UILabel.init()
        self.addSubview(mumberLab)
        mumberLab.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 4)
        }
        mumberLab.text = "成员数量"
        mumberLab.textAlignment = .center
        mumberLab.font = UIFont.boldSystemFont(ofSize: 15)
        mumberLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupMumberLabel() {
        mumberLabel = UILabel.init()
        self.addSubview(mumberLabel)
        mumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mumberLab.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 4)
        }
        mumberLabel.text = "400"
        mumberLabel.textAlignment = .center
        mumberLabel.textColor = UIColor.orange
        mumberLabel.font = UIFont.boldSystemFont(ofSize: 15)
        mumberLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupEstablishTimeLab() {
        establishTimeLab = UILabel.init()
        self.addSubview(establishTimeLab)
        establishTimeLab.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 4)
        }
        establishTimeLab.text = "成立时间"
        establishTimeLab.textAlignment = .center
        establishTimeLab.font = UIFont.boldSystemFont(ofSize: 15)
        establishTimeLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupEstablishTimeLabel() {
        leaderLabel = UILabel.init()
        self.addSubview(leaderLabel)
        leaderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(establishTimeLab.snp.bottom).offset(8)
            make.right.equalTo(-20)
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 4)
        }
        leaderLabel.text = "2018-5-26"
        leaderLabel.textAlignment = .center
        leaderLabel.textColor = UIColor.orange
        leaderLabel.font = UIFont.boldSystemFont(ofSize: 15)
        leaderLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupSegmentController() {
        segmentController = UISegmentedControl(items: ["动态","成员","协会简介"])
        self.addSubview(segmentController)
        segmentController.snp.makeConstraints { (make) in
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.bottom.equalTo(-8)
            make.height.equalTo(30)
        }
        segmentController.tintColor = UIColor.blue
        //segmentController.backgroundColor = UIColor.green
    }
    
    func setupSeparationLine() {
        separationLine = UILabel.init()
        self.addSubview(separationLine)
        separationLine.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            make.left.equalTo(20)
        }
        separationLine.backgroundColor = UIColor.lightGray
    }
}
