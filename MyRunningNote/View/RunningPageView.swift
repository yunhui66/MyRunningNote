//
//  RunningPageView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/16.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit
import SnapKit

class RunningPageView: UIView{

    var targetLab : UILabel = UILabel()
    var distanceLab : UILabel = UILabel()
    var distanceLabel : UILabel = UILabel()
    var speedLab : UILabel = UILabel()
    var speedLabel : UILabel = UILabel()
    var timeLab : UILabel = UILabel()
    var timeLabel : UILabel = UILabel()
    
    private var imgView : UIImageView = UIImageView()
    var distance : UILabel = UILabel()
    var unitLabel : UILabel = UILabel()
    
    var runningBtn : ImageTextButton = ImageTextButton()
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
        
        self.setupDistance()
        self.setupImageView()
        self.setupUnitLab()
        
        self.setupDistanceLab()
        self.setupSpeedLab()
        self.setupTimeLab()
        
        self.setupDistanceLabel()
        self.setupSpeedLabel()
        self.setupTimeLabel()
        
        self.setupRunningBun()
    }
    
    func  setupSubViews() {
        targetLab = UILabel.init()
        self.addSubview(targetLab)
        
        targetLab.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalTo(40)
        }
        targetLab.text = "今日目标"
        targetLab.textAlignment = NSTextAlignment.center
        targetLab.font = UIFont.boldSystemFont(ofSize: 17)
        targetLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupDistance() {
        distance = UILabel.init()
        self.addSubview(distance)
        
        distance.snp.makeConstraints { (make) in
            make.width.equalTo(96)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(targetLab.snp.bottom).offset(16)
        }
        distance.text = "1500"
        distance.textAlignment = NSTextAlignment.center
        distance.font = UIFont.boldSystemFont(ofSize: 38)
        distance.adjustsFontSizeToFitWidth = true
    }
    
    func setupImageView() {
        imgView = UIImageView.init()
        self.addSubview(imgView)
        //先添加到父视图再布局
        imgView.snp.makeConstraints { (make) in
            make.right.equalTo(distance.snp.left).offset(-16)
            make.height.width.equalTo(30)
            make.top.equalTo(targetLab.snp.bottom).offset(16)
        }
        imgView.image = UIImage(named: "mine_header")
    }
    
    func setupUnitLab() {
        unitLabel = UILabel.init()
        self.addSubview(unitLabel)
        
        unitLabel.snp.makeConstraints { (make) in
            make.width.equalTo(32)
            make.height.equalTo(30)
            make.left.equalTo(distance.snp.right).offset(16)
            make.top.equalTo(targetLab.snp.bottom).offset(16)
        }
        unitLabel.text = "米"
        //unitLabel.textAlignment = NSTextAlignment.center
        unitLabel.font = UIFont.boldSystemFont(ofSize: 20)
        unitLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupDistanceLab() {
        distanceLab = UILabel.init()
        self.addSubview(distanceLab)
        
        distanceLab.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-40)/3 )
            make.height.equalTo(21)
            make.left.equalTo(20)
            make.top.equalTo(168)
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
            make.top.equalTo(168)
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
            make.top.equalTo(168)
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
            make.top.equalTo(200)
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
            make.top.equalTo(200)
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
            make.top.equalTo(200)
        }
        timeLabel.text = "1小时20分"
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        timeLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupRunningBun() {
        
        // 样式三: 图片在右 文字在左(自定义文字与图片的间距)
        self.addSubview(runningBtn)
        runningBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-128)
            make.height.equalTo(40)
            make.width.equalTo(SCREEN_WIDTH / 2.5)
        }
        runningBtn.setImage(UIImage(named: "running_start"), for: .normal)
        runningBtn.setTitle("开始跑步", for: .normal)
        runningBtn.setTitleColor(.black, for: .normal)
        runningBtn.spacing = 5
        runningBtn.isReverse = true
        runningBtn.backgroundColor = RGB(r: 14, g: 147, b: 46)
    }
}
