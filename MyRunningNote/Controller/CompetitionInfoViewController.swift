//
//  CompetitionInfoViewController.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/25.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class CompetitionInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "赛事资料"
        self.view.backgroundColor = UIColor.white
        
        self.customNaviBackButton()
        
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customNaviBackButton() {
        // 返回按钮
        let backButton = UIButton(type: .custom)
        
        // 给按钮设置返回箭头图片
        backButton.setImage(UIImage(named:"icon_backHome"), for: .normal)
        backButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        // 设置frame
        backButton.frame = CGRect(x: 0, y: 6, width: 40, height: 30)
        backButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        backButton.setTitle("返回", for: .normal)
        
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let backView = UIBarButtonItem(customView: backButton)
        
        // 重要方法，用来调整自定义返回view距离左边的距离
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = -5
        
        // 返回按钮设置成功
        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }

    @objc func backToPrevious() {
        //print("返回")
        self.navigationController?.popToRootViewController(animated:true)
    }
    
    func initView() {
        //设置表格头部视图
        let competitionInfoView = CompetitionInfoView.init(frame: CGRect(x: 0, y: NAVI_STATUS_HIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVI_STATUS_HIGHT - 44))
        competitionInfoView.scheduleBtn.addTarget(self, action: #selector(competitionProjectTouch), for: .touchUpInside)
        self.view.addSubview(competitionInfoView)
    }
    
    @objc func competitionProjectTouch(){
        
    }
    
}
