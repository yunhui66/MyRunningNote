//
//  NoAssociationView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit
import SnapKit

class NoAssociationView: UIView {

    var noAssociationtLab : UILabel = UILabel()
    var associationLab : UILabel = UILabel()
    var accountLab : UILabel = UILabel()
    var associationImg :UIImageView = UIImageView()
    var separationLine : UIView = UIView()
    
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupNoAssociationLabel()
        self.setupAssociationImage()
        self.setupAssociationLabel()
        self.setupAccountLabel()
        self.setupSeparationLine()
    }

    func setupNoAssociationLabel() {
        noAssociationtLab = UILabel.init()
        self.addSubview(noAssociationtLab)
        noAssociationtLab.snp.makeConstraints { (make) in
            make.top.equalTo(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
            make.width.equalTo(SCREEN_WIDTH / 2)
        }
        noAssociationtLab.text = "您尚未加入任何协会"
        noAssociationtLab.font = UIFont.boldSystemFont(ofSize: 20)
        noAssociationtLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupAssociationImage() {
        associationImg = UIImageView.init()
        self.addSubview(associationImg)
        associationImg.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.bottom.equalTo(0)
            make.height.width.equalTo(30)
        }
        associationImg.image = UIImage(named: "mine_join_association")
    }
    
    func setupAssociationLabel() {
        associationLab = UILabel.init()
        self.addSubview(associationLab)
        associationLab.snp.makeConstraints { (make) in
            make.left.equalTo(associationImg.snp.right).offset(8)
            make.bottom.equalTo(0)
            make.height.equalTo(30)
            make.width.equalTo(SCREEN_WIDTH / 3)
        }
        associationLab.text = "可加入的协会"
        associationLab.font = UIFont.boldSystemFont(ofSize: 15)
        associationLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupAccountLabel() {
        accountLab = UILabel.init()
        self.addSubview(accountLab)
        accountLab.snp.makeConstraints { (make) in
            make.right.equalTo(-16)
            make.bottom.equalTo(0)
            make.height.equalTo(30)
            make.width.equalTo(SCREEN_WIDTH / 3)
        }
        accountLab.text = "共计34个"
        accountLab.textAlignment = .right
        accountLab.font = UIFont.boldSystemFont(ofSize: 15)
        accountLab.adjustsFontSizeToFitWidth = true
    }
    
    func setupSeparationLine() {
        separationLine = UILabel.init()
        self.addSubview(separationLine)
        separationLine.snp.makeConstraints { (make) in
            make.right.equalTo(-16)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            make.left.equalTo(16)
        }
        separationLine.backgroundColor = UIColor.lightGray
    }
    
}
