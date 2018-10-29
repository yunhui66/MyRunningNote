//
//  StadiumHeaderView.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/22.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit
import SnapKit

class StadiumHeaderView: UIView {

    var stadiumImg :UIImageView = UIImageView()
    var stadiumLab:UILabel = UILabel()
    
    var appointmentImg :UIImageView = UIImageView()
    var appointmentLab:UILabel = UILabel()
    
    var stadiumBtn:UIButton = UIButton()
    
    var tableData = [["title":"篮球"], ["title":"羽毛球"], ["title":"乒乓球"], ["title":"足球"],["title":"排球"]]
    
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    
    func setupSubViews() {
        self.setupStadiumImage()
        self.setupTitleLabel()
        self.setupAppointmentImage()
        self.setupAppointmentLabel()
        self.createButton()
    }
    
    func setupStadiumImage()  {
        stadiumImg = UIImageView.init()
        self.addSubview(stadiumImg)
        stadiumImg.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.left.equalTo(16)
            make.height.width.equalTo(30)
        }
        stadiumImg.image = UIImage(named: "stadium_header")
    }
    
    func setupTitleLabel()  {
        stadiumLab = UILabel.init()
        self.addSubview(stadiumLab)
        stadiumLab.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.left.equalTo(stadiumImg.snp.right).offset(8)
            make.height.equalTo(30)
            make.right.equalTo(20)
        }
        stadiumLab.text = "运动场馆"
        stadiumLab.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    func setupAppointmentImage()  {
        appointmentImg = UIImageView.init()
        self.addSubview(appointmentImg)
        appointmentImg.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(16)
            make.height.width.equalTo(30)
        }
        appointmentImg.image = UIImage(named: "stadium_appointment")
    }
    
    func setupAppointmentLabel() {
        appointmentLab = UILabel.init()
        self.addSubview(appointmentLab)
        appointmentLab.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(appointmentImg.snp.right).offset(8)
            make.height.equalTo(30)
            make.right.equalTo(20)
        }
        appointmentLab.text = "预约记录"
        appointmentLab.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    func createButton() {
        let heigth:CGFloat = 75
        let width:CGFloat = 75
        let col = 3
        
        // 设置格子的间距
        let screenSize:CGSize = self.frame.size
        let hMargin:CGFloat = (screenSize.width - (CGFloat(col) * width)) / CGFloat((col+1))
        
        var row:Int = 0
        for i in 0...4 {
            stadiumBtn = UIButton()
            let item = tableData[i]
            stadiumBtn.setTitle(item["title"], for: .normal)
            stadiumBtn.setTitleColor(UIColor.black, for: .normal)
            stadiumBtn.layer.cornerRadius = heigth / 2
            // 设置图片的外围圆框*
            stadiumBtn.layer.masksToBounds = true
            stadiumBtn.layer.borderColor = UIColor.orange.cgColor
            stadiumBtn.layer.borderWidth = 1
            
            stadiumBtn.tag = row
            
            if i%3 == 0 {
                row = row + 1
            }
            
            let x:CGFloat = hMargin + (width + hMargin) * CGFloat(i%col)
            let y:CGFloat = 66 + (heigth+16) * CGFloat(row - 1)

            stadiumBtn.frame = CGRect(x: x, y: y, width: width, height: heigth)
            self.addSubview(stadiumBtn)
        }
    }
}
