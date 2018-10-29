//
//  MineHeaderView.swift
//  MyRunningNote
//
//  Created by 陈义星 on 2018/8/22.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit
import SnapKit

class MineHeaderView: UIView {

    var headerImg : UIImageView = UIImageView()
    var sexImg :UIImageView = UIImageView()
    var nameLab:UILabel = UILabel()
    var phoneLabel:UILabel = UILabel()
    var classLab:UILabel = UILabel()
    var arrowImg:UIImageView = UIImageView()
    
    
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
        self.setupHeaderImage()
        self.setupSexImage()
        self.setupUserName()
        self.setupPhoneNumber()
        self.setupClass()
        self.setupArrowImg()
    }
    
    func setupHeaderImage() {
        headerImg = UIImageView.init()
        self.addSubview(headerImg)
        //先添加到父视图再布局
        headerImg.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(80)
        }
        headerImg.image = UIImage(named: "mine_header")
        print("\(headerImg.frame.size.height)")
        headerImg.layer.cornerRadius = 40
        headerImg.layer.masksToBounds = true
        headerImg.layer.borderColor = UIColor.orange.cgColor
        headerImg.layer.borderWidth = 1
    }
    
    func setupSexImage() {
        sexImg = UIImageView.init()
        self.addSubview(sexImg)
        sexImg.snp.makeConstraints { (make) in
            make.left.equalTo(headerImg.snp.right).offset(8)
            make.height.width.equalTo(30)
            make.top.equalTo(11)
        }
        sexImg.image = UIImage(named: "mine_sex_man")
    }
    
    func setupUserName() {
        nameLab = UILabel.init()
        self.addSubview(nameLab)
        nameLab.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.left.equalTo(sexImg.snp.right).offset(8)
            make.height.equalTo(21)
            make.right.equalTo(-20)
        }
        nameLab.text = "符云辉 | 7220160254"
        nameLab.font = UIFont.boldSystemFont(ofSize: 14)
        nameLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupPhoneNumber()  {
        phoneLabel = UILabel.init()
        self.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImg.snp.right).offset(46)
            make.top.equalTo(nameLab.snp.bottom).offset(8)
            make.height.equalTo(21)
            make.right.equalTo(-20)
        }
        phoneLabel.text = "17709018540"
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 14)
        phoneLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupClass()  {
        classLab = UILabel.init()
        self.addSubview(classLab)
        classLab.snp.makeConstraints { (make) in
            make.left.equalTo(headerImg.snp.right).offset(46)
            make.top.equalTo(phoneLabel.snp.bottom).offset(8)
            make.height.equalTo(21)
            make.right.equalTo(-20)
        }
        classLab.text = "计算机科学学院 | 09年级01班"
        classLab.font = UIFont.boldSystemFont(ofSize: 14)
        classLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupArrowImg() {
        arrowImg = UIImageView.init()
        self.addSubview(arrowImg)
        //先添加到父视图再布局
        arrowImg.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(nameLab.snp.bottom).offset(8)
            //make.centerY.equalToSuperview()
            make.height.width.equalTo(21)
        }
        arrowImg.image = UIImage(named: "mine_right_arrow")
    }
}
