//
//  MBProgressExtension.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/9/3.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

extension MBProgressHUD {
    //显示等待消息
    class func showWait(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    //显示普通消息
    class func showInfo(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "icon_tip_info")!) //自定义视图显示图片
        hud.label.text = title
        hud.label.textColor = UIColor.white
        hud.bezelView.backgroundColor = UIColor.black
        hud.isSquare = true
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 2.0)
    }
    
    //显示成功消息
    class func showSuccess(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "icon_success")!) //自定义视图显示图片
        hud.label.text = title
        hud.label.textColor = UIColor.white
        hud.bezelView.backgroundColor = UIColor.black
        hud.isSquare = true
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    //显示失败消息
    class func showError(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "icon_failure")!) //自定义视图显示图片
        hud.label.text = title
        hud.label.textColor = UIColor.white
        hud.bezelView.backgroundColor = UIColor.black
        hud.isSquare = true
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    //获取用于显示提示框的view
    class func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindowLevelNormal {
                    window = tempWin;
                    break
                }
            }
        }
        return window!
    }
}

