//
//  MapHeaderView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/26.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class MapHeaderView: UIView {

    var distanceLab:UILabel = UILabel()
    var distanceLabel:UILabel = UILabel()
    
    var speedLab:UILabel = UILabel()
    var speedLabel:UILabel = UILabel()
    
    var timeLab:UILabel = UILabel()
    var timeLabel:UILabel = UILabel()
    
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupDistanceLab()
        self.setupDistanceLabel()
        
        self.setupSpeedLab()
        self.setupSpeedLabel()
        
        self.setupTimeLab()
        self.setupTimeLabel()
    }

    func setupDistanceLab() {
        distanceLab = UILabel.init()
        self.addSubview(distanceLab)

        distanceLab.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(20)
            make.top.equalTo(16)
        }
        distanceLab.text = "距离(米)"
        distanceLab.textAlignment = NSTextAlignment.center
        distanceLab.font = UIFont.boldSystemFont(ofSize: 17)
        distanceLab.adjustsFontSizeToFitWidth = true
    }

    func setupSpeedLab() {
        speedLab = UILabel.init()
        self.addSubview(speedLab)
        
        speedLab.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(distanceLab.snp.right).offset(0)
            make.top.equalTo(16)
        }
        speedLab.text = "时速"
        speedLab.textAlignment = NSTextAlignment.center
        speedLab.font = UIFont.boldSystemFont(ofSize: 17)
        speedLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupTimeLab() {
        timeLab = UILabel.init()
        self.addSubview(timeLab)
        
        timeLab.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(speedLab.snp.right).offset(0)
            make.top.equalTo(16)
        }
        timeLab.text = "时长(时分秒)"
        timeLab.textAlignment = NSTextAlignment.center
        timeLab.font = UIFont.boldSystemFont(ofSize: 17)
        timeLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupDistanceLabel() {
        distanceLabel = UILabel.init()
        self.addSubview(distanceLabel)
        
        distanceLabel.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(20)
            make.top.equalTo(distanceLab.snp.bottom).offset(8)
        }
        distanceLabel.text = "1000 m"
        distanceLabel.textAlignment = NSTextAlignment.center
        distanceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        distanceLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupSpeedLabel() {
        speedLabel = UILabel.init()
        self.addSubview(speedLabel)
        
        speedLabel.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(distanceLabel.snp.right).offset(0)
            make.top.equalTo(speedLab.snp.bottom).offset(8)
        }
        speedLabel.text = "4.5 m/s"
        speedLabel.textAlignment = NSTextAlignment.center
        speedLabel.font = UIFont.boldSystemFont(ofSize: 14)
        speedLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupTimeLabel() {
        timeLabel = UILabel.init()
        self.addSubview(timeLabel)
        
        timeLabel.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(speedLabel.snp.right).offset(0)
            make.top.equalTo(speedLab.snp.bottom).offset(8)
        }
        timeLabel.text = "1小时20分"
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        timeLabel.adjustsFontSizeToFitWidth = true
    }
}
