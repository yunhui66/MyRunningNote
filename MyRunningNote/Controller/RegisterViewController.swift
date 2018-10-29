//
//  RegisterViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/28.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var registerView:RegisterView!
    var viewModel:RegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegisterViewModel()
        self.setupSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupSubviews() {
        registerView = RegisterView.init(frame: self.view.bounds)
        
        //手机号输入框添加监听事件
        registerView.phoneText.addTarget(self, action: #selector(userNameChanged(field:)), for: .editingChanged)
        //验证码输入框添加监听事件
        registerView.codeText.addTarget(self, action: #selector(codeTextChanged(field:)), for: .editingChanged)
        //密码输入框添加监听事件
        registerView.pwdText.addTarget(self, action: #selector(passwordChanged(field:)), for: .editingChanged)
        //返回按钮添加监听事件
        registerView.backBtn.addTarget(self, action: #selector(backLoginAction(sender:)), for: .touchUpInside)
        //验证码发送按钮按钮添加监听事件
        registerView.codeSenderBtn.addTarget(self, action: #selector(codeSenderAction(sender:)), for: .touchUpInside)
        //注册按钮添加监听事件
        registerView.registerBtn.addTarget(self, action: #selector(registerAction(sender:)), for: .touchUpInside)
        
        self.view.addSubview(registerView)

        //注册点击页面空白处回收键盘事件监听
        let keyboardGesture = UITapGestureRecognizer.init(target: self, action: #selector(keyboardHandTap(sender:)))
        self.view.addGestureRecognizer(keyboardGesture)
        
    }
    
    //手机号输入框输入变化检测
    @objc func userNameChanged(field: UITextField){
        viewModel.userNameChanged(text: field.text)
    }
    
    //密码输入框输入变化检测
    @objc func passwordChanged(field: UITextField){
        viewModel.passwordChanged(text: field.text)
    }
    
    //验证码输入框输入变化检测
    @objc func codeTextChanged(field: UITextField){
        viewModel.codeTextChanged(text: field.text)
    }
    
    //返回按钮点击响应事件
    @objc func backLoginAction(sender: UIButton){
        viewModel.backLoginAction(controller: self)
    }
    
    //返送验证码按钮点击响应事件
    @objc func codeSenderAction(sender: UIButton){
        viewModel.codeSenderAction(button: sender)
    }
    
    //注册按钮点击响应事件
    @objc func registerAction(sender: UIButton){
        viewModel.registerAction(controller: self)
    }
    
    //点击页面空白处回收键盘
    @objc func keyboardHandTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            registerView.phoneText.resignFirstResponder()
            registerView.codeText.resignFirstResponder()
            registerView.pwdText.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
}
