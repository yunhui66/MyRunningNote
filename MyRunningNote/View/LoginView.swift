//
//  LoginView.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/28.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    var welcomLogin:UILabel!
    
    var phoneText:UITextField!
    var pwdText:UITextField!
    var line1:UIView!
    var line2:UIView!
    
    var loginBtn:UIButton!
    
    var forgetPwd:UILabel!
    var register:UILabel!
    

    //swift推荐我们自定义一个控件 要么用纯代码，要么用xib／storyboard方式
    required init(coder aDecoder: NSCoder) {
        //如果通过xib／storyboard方式系统就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupWelcomeLogin()
        
        self.setupPhoneText()
        self.setupLine1()
        
        self.setupPwdText()
        self.setupLine2()
        
        self.setupLoginBtn()
        
        self.setupRegister()
        self.setupForgetPwd()
    }
    
    func setupWelcomeLogin() {
        welcomLogin = UILabel()
        self.addSubview(welcomLogin)
        welcomLogin.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(40)
        }
        welcomLogin.text = "欢迎登录"
        welcomLogin.adjustsFontSizeToFitWidth = true
        welcomLogin.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func setupPhoneText() {
        phoneText = UITextField()
        self.addSubview(phoneText)
        phoneText.snp.makeConstraints { (make) in
            make.top.equalTo(welcomLogin).offset(64)
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
    
    func setupPwdText() {
        pwdText = UITextField()
        self.addSubview(pwdText)
        pwdText.snp.makeConstraints { (make) in
            make.top.equalTo(phoneText.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.height.equalTo(50)
            make.width.equalTo(SCREEN_WIDTH - 64)
        }
        pwdText.placeholder = "请输入密码"
        pwdText.font = UIFont.boldSystemFont(ofSize: 16)
        pwdText.isSecureTextEntry = true
    }
    
    func setupLine2(){
        line2 = UIView()
        self.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(1)
            make.top.equalTo(pwdText.snp.bottom).offset(0)
        }
        line2.backgroundColor = UIColor.black
        line2.alpha = 0.3
    }
    
    func setupLoginBtn(){
        loginBtn = UIButton()
        self.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREEN_WIDTH - 64)
            make.height.equalTo(48)
            make.top.equalTo(pwdText.snp.bottom).offset(40)
        }
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginBtn.layer.cornerRadius = 24
        loginBtn.backgroundColor = RGB(r: 14, g: 147, b: 46)
        loginBtn.alpha = 0.3
    }
    
    func setupRegister()  {
        register = UILabel()
        self.addSubview(register)
        register.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-80)/2)
            make.height.equalTo(30)
            make.top.equalTo(loginBtn.snp.bottom).offset(16)
            make.left.equalTo(32)
        }
        register.isUserInteractionEnabled = true
        register.text = "新用户，注册？"
        register.font = UIFont.boldSystemFont(ofSize: 14)
        register.textAlignment = .left
        register.alpha = 0.3
    }
    
    func setupForgetPwd()  {
        forgetPwd = UILabel()
        self.addSubview(forgetPwd)
        forgetPwd.snp.makeConstraints { (make) in
            make.width.equalTo((SCREEN_WIDTH-80)/2)
            make.height.equalTo(30)
            make.top.equalTo(loginBtn.snp.bottom).offset(16)
            make.right.equalTo(-32)
        }
        forgetPwd.isUserInteractionEnabled = true
        forgetPwd.text = "忘记密码？"
        forgetPwd.font = UIFont.boldSystemFont(ofSize: 14)
        forgetPwd.textAlignment = .right
        forgetPwd.alpha = 0.3        
    }
}
