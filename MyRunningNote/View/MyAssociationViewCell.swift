//
//  MyAssociationViewCell.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class MyAssociationViewCell: UITableViewCell {

    @IBOutlet weak var associationLab:UILabel!
    @IBOutlet weak var classLab:UILabel!
    @IBOutlet weak var infoLab:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        classLab.adjustsFontSizeToFitWidth = true
        associationLab.adjustsFontSizeToFitWidth = true
        
        infoLab.layer.cornerRadius = infoLab.frame.size.width/2
        infoLab.layer.masksToBounds = true
        infoLab.layer.borderColor = UIColor.orange.cgColor
        infoLab.layer.borderWidth = 1
        infoLab.backgroundColor = UIColor.red
        infoLab.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
