//
//  StadiumViewCell.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/22.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class StadiumViewCell: UITableViewCell {

    @IBOutlet weak var stadiumTime:UILabel!
    @IBOutlet weak var stadiumPlace:UILabel!
    @IBOutlet weak var stadiumConfirm:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
