//
//  LoginViewModel.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/26.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit


class LoginViewModel: NSObject{
    
    var loginModel:LoginModel!
    //var loginView:LoginView!
    

    private var usernameValid = false
    private var passwordValid = false
    private var userName: String?
    private var password: String?
    
    //用户名输入判断
    func userNameDidChange(text: String?) {
        if text!.count < 6 {
            usernameValid = false
        } else {
            usernameValid = true
        }
        userName = text

    }
    
    //用户密码输入判断
    func passwordDidChange(text: String?) {
        if text!.count < 6 {
            passwordValid = false
        } else {
            passwordValid = true
        }
        password = text
    }

    //用户登录行为
    func loginBtnAction(controller:UIViewController) {
        if usernameValid && passwordValid {
            
            //首次登陆
            UserDefaults.standard.set(false, forKey: "isFirstLogin")
            UserDefaults.standard.synchronize()
            
            let tabbarVC = RNTabBarViewController()
            tabbarVC.modalTransitionStyle = .crossDissolve
            controller.present(tabbarVC, animated: true, completion: nil)
        }else{
            NSLog("用户名或密码错误")
        }

    }
    
    //新用户注册点击响应事件
    func registerdAction(controller:UIViewController)  {
        //实例化一个将要跳转的viewController
        let registerVC = RegisterViewController()
        registerVC.modalTransitionStyle = .crossDissolve
        //跳转
        controller.present(registerVC, animated: true, completion: nil)
    }
    
    //忘记密码点击响应事件
    func forgetPwdAction(controller:UIViewController)  {
        //实例化一个将要跳转的viewController
        let findPwdVC = FindPwdViewController()
        findPwdVC.modalTransitionStyle = .crossDissolve
        //跳转
        controller.present(findPwdVC, animated: true, completion: nil)
    }
}
