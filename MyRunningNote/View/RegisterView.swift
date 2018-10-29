//
//  UserRegisterView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/26.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RegisterView: UIView {

    var backBtn:UIButton!
    var registerTitle:UILabel!
    
    var phoneText:UITextField!
    var codeText:UITextField!
    var pwdText:UITextField!
    
    var line1:UIView!
    var line2:UIView!
    var line3:UIView!
    
    var codeSenderBtn:UIButton!
    
    var registerBtn:UIButton!
    
    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackImage()
        self.setupRegisterTitle()
        
        self.setupPhoneText()
        self.setupLine1()
        
        self.setupCodeText()
        self.setupLine2()
        self.setupcodeSenderBtn()
        
        self.setupPwdText()
        self.setupLine3()
        
        self.setupRegisterBtn()
    }

    func setupBackImage() {
        backBtn = UIButton()
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(STATUS_BAR_HIGHT+7)
            make.left.equalTo(20)
            make.width.height.equalTo(30)
        }
        backBtn.setBackgroundImage(UIImage.init(named: "mine_back_login"), for: .normal)
    }
    
    func setupRegisterTitle()  {
        registerTitle = UILabel()
        self.addSubview(registerTitle)
        registerTitle.snp.makeConstraints { (make) in
            make.top.equalTo(STATUS_BAR_HIGHT+7)
            make.centerX.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(SCREEN_WIDTH/3)
        }
        registerTitle.text = "注册账户"
        registerTitle.textAlignment = .center
        registerTitle.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func setupPhoneText() {
        phoneText = UITextField()
        self.addSubview(phoneText)
        phoneText.snp.makeConstraints { (make) in
            make.top.equalTo(registerTitle.snp.bottom).offset(71)
            make.centerX.equalTo(self)
            make.height.equalTo(50)
            make.width.equalTo(SCREEN_WIDTH - 64)
        }
        phoneText.placeholder = "请输入手机号"
        phoneText.font = UIFont.boldSystemFont(ofSize: 16)
        phoneText.clearButtonMode = .whileEditing
    }
    
    func setupLine1(){
        line1 = UIView()
        self.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(1)
            make.top.equalTo(phoneText.snp.bottom).offset(0)
        }
        line1.backgroundColor = UIColor.black
        line1.alpha = 0.3
    }
    
    func setupCodeText() {
        codeText = UITextField()
        self.addSubview(codeText)
        codeText.snp.makeConstraints { (make) in
            make.top.equalTo(phoneText.snp.bottom).offset(20)
            make.left.equalTo(32)
            make.height.equalTo(50)
            make.width.equalTo((SCREEN_WIDTH - 64)/2)
        }
        codeText.placeholder = "请输入验证码"
        codeText.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupLine2(){
        line2 = UIView()
        self.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(1)
            make.top.equalTo(codeText.snp.bottom).offset(0)
        }
        line2.backgroundColor = UIColor.black
        line2.alpha = 0.3
    }
    
    func setupcodeSenderBtn() {
        codeSenderBtn = UIButton()
        self.addSubview(codeSenderBtn)
        codeSenderBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-32)
            make.top.equalTo(phoneText.snp.bottom).offset(20)
            make.width.equalTo((SCREEN_WIDTH-64)/2)
            make.height.equalTo(50)
        }
        codeSenderBtn.setTitle("获取验证码", for: .normal)
        codeSenderBtn.setTitleColor(UIColor.black, for: .normal)
        codeSenderBtn.alpha = 0.3
        codeSenderBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        codeSenderBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        codeSenderBtn.contentHorizontalAlignment = .right
    }
    
    func setupPwdText() {
        pwdText = UITextField()
        self.addSubview(pwdText)
        pwdText.snp.makeConstraints { (make) in
            make.top.equalTo(codeText.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.height.equalTo(50)
            make.width.equalTo(SCREEN_WIDTH - 64)
        }
        pwdText.placeholder = "请输入密码"
        pwdText.font = UIFont.boldSystemFont(ofSize: 16)
        pwdText.isSecureTextEntry = true
    }
    
    func setupLine3(){
        line3 = UIView()
        self.addSubview(line3)
        line3.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(1)
            make.top.equalTo(pwdText.snp.bottom).offset(0)
        }
        line3.backgroundColor = UIColor.black
        line3.alpha = 0.3
    }
    
    func setupRegisterBtn(){
        registerBtn = UIButton()
        self.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(48)
            make.top.equalTo(pwdText.snp.bottom).offset(40)
        }
        registerBtn.setTitle("注册", for: .normal)
        registerBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        registerBtn.layer.cornerRadius = 24
        registerBtn.backgroundColor = RGB(r: 14, g: 147, b: 46)
        registerBtn.alpha = 0.3
    }
}
 
