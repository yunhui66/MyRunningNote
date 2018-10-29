//
//  DynamicationTableCell.swift
//  MyRunningNote
//
//  Created by 符云辉 on 2018/8/23.
//  Copyright © 2018年 fuyunhui. All rights reserved.
//

import UIKit

class DynamicationTableCell: UITableViewCell {

    @IBOutlet weak var timeLabel:UILabel!
    @IBOutlet weak var contentText:UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentText.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
