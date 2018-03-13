//
//  CollectionViewCell.swift
//  Day05
//
//  Created by canoe on 2018/3/13.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var logoView:UIImageView!
    var titleLabel:UILabel!
    var effectView:UIVisualEffectView!
    
    var model:Model! {
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
        logoView.image = UIImage.init(named: model.imageName)
        titleLabel.text = model.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        
        logoView = UIImageView.init(frame: self.bounds)
        logoView.contentMode = .scaleAspectFill
        contentView.addSubview(logoView)
        
        let blurEffect = UIBlurEffect.init(style: .light)
        
        effectView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 340, width: self.frame.size.width, height: 60))
        effectView.effect = blurEffect
        contentView.addSubview(effectView)
        
        titleLabel = UILabel.init(frame: effectView.frame)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 10.0;
        contentView.clipsToBounds = true
    }
}
