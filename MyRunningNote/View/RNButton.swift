//
//  RNButton.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class RNButton: UIButton {

    //MARK:- 重写init函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named:"running_start"), for: .normal)
        setImage(UIImage(named:"running_start"), for: .selected)
        setTitleColor(UIColor.black, for: .normal)
        //backgroundColor = UIColor.cyan
        
        
    }

    //swift中规定:重写控件的init(frame方法)或者init()方法.必须重写 init?(coder aDecoder: NSCoder)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //titleLabel ,imageView中间的空隙宽度
        let spaceWid = CGFloat(5)
        //btn的宽度
        let btnWid = frame.size.width
        //titleLabel ,imageView的总宽度 加 空隙
        let wid = titleLabel!.frame.size.width + imageView!.frame.size.width + spaceWid
        
        titleLabel!.frame.origin.x = (btnWid-wid)*0.5
        imageView!.frame.origin.x = titleLabel!.frame.maxX + spaceWid
        
    }

}
