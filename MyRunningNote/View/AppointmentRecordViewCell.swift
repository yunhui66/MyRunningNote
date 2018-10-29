//
//  AppointmentRecordViewCell.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class AppointmentRecordViewCell: UITableViewCell {

    @IBOutlet weak var timeLab:UILabel!
    @IBOutlet weak var placeLab:UILabel!
    @IBOutlet weak var statusLab:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
