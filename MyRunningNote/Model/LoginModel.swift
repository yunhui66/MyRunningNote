//
//  LoginModel.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/10/26.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class LoginModel: NSObject {

    var userName:String?
    var userPwd:String?
    
    init(userName:String,userPwd:String) {
        self.userName = userName
        self.userPwd = userPwd
    }
}
