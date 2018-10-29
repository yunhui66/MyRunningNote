//
//  MineTableViewCell.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/16.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class CompetitionTableViewCell: UITableViewCell {

    @IBOutlet weak var competitionTime:UILabel!
    @IBOutlet weak var competitionName:UILabel!
    @IBOutlet weak var competitionProgress:UILabel!
    @IBOutlet weak var imgProgress:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
}
