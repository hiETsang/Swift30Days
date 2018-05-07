//
//  TableViewCell.swift
//  Day21
//
//  Created by canoe on 2018/5/6.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var coolImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
