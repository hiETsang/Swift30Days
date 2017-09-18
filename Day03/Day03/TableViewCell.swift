//
//  TableViewCell.swift
//  Day03
//
//  Created by canoe on 2017/9/18.
//  Copyright © 2017年 canoe. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var backgroundImageView:UIImageView?
    var palyView:UIImageView?
    var titleLabel:UILabel?
    var descLabel:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configUI()
    }
    
    func configUI() {
        self.backgroundImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 220))
        self.contentView.addSubview(self.backgroundImageView!)
        
        self.palyView = UIImageView.init(frame: CGRect.init(x: UIScreen.main.bounds.size.width/2 - 25, y: 110 - 25, width: 50, height: 50))
        self.contentView.addSubview(self.palyView!)
        self.palyView?.image = UIImage.init(named: "playBtn")
        
        self.titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 173, width: UIScreen.main.bounds.size.width, height: 20))
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        self.titleLabel?.textAlignment = .center
        
        self.descLabel = UILabel.init(frame: CGRect.init(x: 0, y: 197, width: UIScreen.main.bounds.size.width, height: 14))
        self.contentView.addSubview(self.descLabel!)
        self.descLabel?.textColor = .white
        self.descLabel?.font = UIFont.systemFont(ofSize: 10)
        self.descLabel?.textAlignment = .center
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
