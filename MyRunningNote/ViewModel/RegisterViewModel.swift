//
//  RegisterViewModel.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/29.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RegisterViewModel: NSObject {

    var codeSenderBtn:UIButton!
    
    var countdownTimer: Timer?
    
    var remainingSeconds: Int = 0 {
        willSet {
            codeSenderBtn.setTitle("(\(newValue))秒重新获取", for: .normal)

            if newValue <= 0 {
                codeSenderBtn.setTitle("重新获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime(timer:)), userInfo: nil, repeats: true)
                remainingSeconds = 10
                //codeSenderBtn.backgroundColor = UIColor.gray.
                codeSenderBtn.alpha = 0.5
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                //codeSenderBtn.backgroundColor = UIColor.red
                codeSenderBtn.alpha = 0.5
            }
            
            codeSenderBtn.isEnabled = !newValue
        }
    }
    
    //手机号输入框输入变化检测
    func userNameChanged(text:String?){
        
    }
    
    //密码输入框输入变化检测
    func passwordChanged(text:String?){
        
    }
    
    //验证码输入框输入变化检测
    func codeTextChanged(text:String?){
        
    }
    
    //返回按钮点击响应事件
    func backLoginAction(controller:UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
    
    //返送验证码按钮点击响应事件
    func codeSenderAction(button: UIButton){
        NSLog("获取验证码")
        codeSenderBtn = button;
        isCounting = true
    }
    
    //注册按钮点击响应事件
    func registerAction(controller:UIViewController){
        
    }
    
    @objc func updateTime(timer: Timer) {
        remainingSeconds -= 1
    }

}
