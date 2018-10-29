//
//  LoginViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/6.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView:LoginView!
    var viewModel:LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden = true
        
        self.setupViews()
        viewModel = LoginViewModel()
        
    }
    
    //布局子视图
    func setupViews() {
        loginView = LoginView.init(frame: CGRect(x: 0, y: NAVI_STATUS_HIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-NAVI_STATUS_HIGHT))
        loginView.phoneText.addTarget(self, action: #selector(userNameChanged(field:)), for: .editingChanged)
        loginView.pwdText.addTarget(self, action: #selector(passwordChanged(field:)), for: .editingChanged)
        loginView.loginBtn.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)

        //忘记密码UIlabel添加手势
        let forgetTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(forgetPwdAction(sender:)))
        loginView.forgetPwd.addGestureRecognizer(forgetTapGesture)
        //用户注册UIlabel添加手势
        let registerTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(registerdAction(sender:)))
        loginView.register.addGestureRecognizer(registerTapGesture)
        
        self.view.addSubview(loginView)
        
        //注册点击页面空白处回收键盘事件监听
        let keyboardGesture = UITapGestureRecognizer.init(target: self, action: #selector(keyboardHandTap(sender:)))
        self.view.addGestureRecognizer(keyboardGesture)
    }
    
    //手机号输入框输入变化检测
    @objc func userNameChanged(field:UITextField) {
        viewModel.userNameDidChange(text: field.text)
    }
    
    //密码输入框输入变化检测
    @objc func passwordChanged(field:UITextField) {
        viewModel.passwordDidChange(text: field.text)    }
    
    //登录按钮点击事件
    @objc func loginAction(sender: AnyObject) {
        viewModel.loginBtnAction(controller:self)
    }
    
    //忘记密码或注册点击事件
    @objc func forgetPwdAction(sender: UITapGestureRecognizer) {
        viewModel.forgetPwdAction(controller: self)
    }
    
    //忘记密码或注册点击事件
    @objc func registerdAction(sender: UITapGestureRecognizer) {
        viewModel.registerdAction(controller: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //点击页面空白处回收键盘
    @objc func keyboardHandTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            loginView.phoneText.resignFirstResponder()
            loginView.pwdText.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
}
