//
//  CompetitionInfoView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/25.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class CompetitionInfoView: UIView {

    var titleLab : UILabel = UILabel()
    
    var dateImg :UIImageView = UIImageView()
    var dateLab : UILabel = UILabel()
    var dateLabel : UILabel = UILabel()
    
    var departmentImg :UIImageView = UIImageView()
    var departmentLab : UILabel = UILabel()
    var departmentLabel : UILabel = UILabel()
    
    var scheduleImg :UIImageView = UIImageView()
    var scheduleLab : UILabel = UILabel()
    var scheduleBtn:UIButton = UIButton()
    
    var tableData = [["title":"篮球"], ["title":"羽毛球"], ["title":"乒乓球"], ["title":"足球"],["title":"排球"],["title":"田径"],["title":"游泳"],["title":"拔河"]]
    
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupTitleLab()
        
        self.setupDateImage()
        self.setupDateLab()
        self.setupDateLabel()
        
        self.setupDepartmentImage()
        self.setupDepartmentLab()
        self.setupDepartmentLabel()
        
        self.setupSchedueImage()
        self.setupSchedueLab()
        self.createButton()
    }

    func setupTitleLab() {
        titleLab = UILabel.init()
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(21)
        }
        titleLab.text = "西南科技大学夏季运动会"
        //titleLab.textAlignment = .center
        //titleLab.textColor = UIColor.orange
        titleLab.font = UIFont.boldSystemFont(ofSize: 18)
        titleLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupDateImage() {
        dateImg = UIImageView.init()
        self.addSubview(dateImg)
        dateImg.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom).offset(24)
            make.left.equalTo(20)
            make.height.width.equalTo(24)
        }
        dateImg.image = UIImage(named: "competition_date")
    }
    
    func setupDateLab() {
        dateLab = UILabel.init()
        self.addSubview(dateLab)
        dateLab.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom).offset(24)
            make.left.equalTo(dateImg.snp.right).offset(8)
            make.height.equalTo(24)
            make.right.equalTo(-20)
        }
        dateLab.text = "起止日期"
        //titleLab.textAlignment = .center
        //titleLab.textColor = UIColor.orange
        dateLab.font = UIFont.boldSystemFont(ofSize: 17)
        dateLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupDateLabel() {
        dateLabel = UILabel.init()
        self.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLab.snp.bottom).offset(8)
            make.left.equalTo(64)
            make.height.equalTo(24)
            make.right.equalTo(-20)
        }
        dateLabel.text = "2018/5/20 ~ 2018/5/30"
        //titleLab.textAlignment = .center
        //titleLab.textColor = UIColor.orange
        dateLabel.font = UIFont.boldSystemFont(ofSize: 14)
        dateLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupDepartmentImage() {
        departmentImg = UIImageView.init()
        self.addSubview(departmentImg)
        departmentImg.snp.makeConstraints { (make) in
            make.top.equalTo(dateImg.snp.bottom).offset(48)
            make.left.equalTo(20)
            make.height.width.equalTo(24)
        }
        departmentImg.image = UIImage(named: "competition_department")
    }
    
    func setupDepartmentLab() {
        departmentLab = UILabel.init()
        self.addSubview(departmentLab)
        departmentLab.snp.makeConstraints { (make) in
            make.top.equalTo(dateLab.snp.bottom).offset(48)
            make.left.equalTo(departmentImg.snp.right).offset(8)
            make.height.equalTo(24)
            make.right.equalTo(-20)
        }
        departmentLab.text = "参加院系"
        //titleLab.textAlignment = .center
        //titleLab.textColor = UIColor.orange
        departmentLab.font = UIFont.boldSystemFont(ofSize: 17)
        departmentLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupDepartmentLabel() {
        departmentLabel = UILabel.init()
        self.addSubview(departmentLabel)
        departmentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(departmentLab.snp.bottom).offset(8)
            make.left.equalTo(64)
            make.height.equalTo(24)
            make.right.equalTo(-20)
        }
        departmentLabel.text = "全校所有院系"
        //titleLab.textAlignment = .center
        //titleLab.textColor = UIColor.orange
        departmentLabel.font = UIFont.boldSystemFont(ofSize: 14)
        departmentLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupSchedueImage() {
        scheduleImg = UIImageView.init()
        self.addSubview(scheduleImg)
        scheduleImg.snp.makeConstraints { (make) in
            make.top.equalTo(departmentImg.snp.bottom).offset(48)
            make.left.equalTo(20)
            make.height.width.equalTo(24)
        }
        scheduleImg.image = UIImage(named: "competition_schedue")
    }
    
    func setupSchedueLab() {
        scheduleLab = UILabel.init()
        self.addSubview(scheduleLab)
        scheduleLab.snp.makeConstraints { (make) in
            make.top.equalTo(departmentLab.snp.bottom).offset(48)
            make.left.equalTo(scheduleImg.snp.right).offset(8)
            make.height.equalTo(24)
            make.right.equalTo(-20)
        }
        scheduleLab.text = "比赛日程"
        //titleLab.textAlignment = .center
        //titleLab.textColor = UIColor.orange
        scheduleLab.font = UIFont.boldSystemFont(ofSize: 17)
        scheduleLab.adjustsFontSizeToFitWidth = true
    }
    
    func createButton() {
        let heigth:CGFloat = 48
        let width:CGFloat = SCREEN_WIDTH / 3
        //设置每行按钮个数
        let col = 2
        
        // 设置格子的间距
        let screenSize:CGSize = self.frame.size
        let hMargin:CGFloat = (screenSize.width - (CGFloat(col) * width)) / CGFloat((col+1))
        
        var row:Int = 0
        for i in 0...7 {
            scheduleBtn = UIButton()
            let item = tableData[i]
            scheduleBtn.setTitle(item["title"], for: .normal)
            scheduleBtn.setTitleColor(UIColor.black, for: .normal)
            //scheduleBtn.layer.cornerRadius = heigth / 2
            scheduleBtn.backgroundColor = UIColor.lightGray
            // 设置图片的外围圆框*
            //scheduleBtn.layer.masksToBounds = true
            //scheduleBtn.layer.borderColor = UIColor.orange.cgColor
            //scheduleBtn.layer.borderWidth = 1
            
            scheduleBtn.tag = row
            
            if i%col == 0 {
                row = row + 1
            }
            
            let x:CGFloat = hMargin + (width + hMargin) * CGFloat(i%col)
            let y:CGFloat = 248 + (heigth+16) * CGFloat(row - 1)
            
            scheduleBtn.frame = CGRect(x: x, y: y, width: width, height: heigth)

            self.addSubview(scheduleBtn)
        }
    }
}
