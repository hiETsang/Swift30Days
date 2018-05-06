//
//  CollectionViewCell.swift
//  Day20
//
//  Created by canoe on 2018/5/6.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

typealias clickBlock = (CollectionViewCell) -> Void

class CollectionViewCell: UICollectionViewCell {
    
    var fullScreen = false {
        didSet{
            backButton.isHidden = !fullScreen
        }
    }

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var backButtonTapped :clickBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backButton.isHidden = true
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
    }
    
    @objc func backButtonClick() {
        self.backButtonTapped?(self)
    }

}
