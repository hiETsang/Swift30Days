//
//  MainTableViewCell.swift
//  Day16
//
//  Created by canoe on 2018/4/22.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView?
    @IBOutlet weak var headerImageView: UIImageView?
    @IBOutlet weak var mainLabel: UILabel?
    @IBOutlet weak var descLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerImageView?.layer.masksToBounds = true
        headerImageView?.layer.cornerRadius = (headerImageView?.frame.size.width)!/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
