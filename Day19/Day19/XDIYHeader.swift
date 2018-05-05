//
//  XDIYHeader.swift
//  Day19
//
//  Created by canoe on 2018/5/3.
//  Copyright © 2018年 canoe. All rights reserved.
//

import Foundation

class XDIYHeader: MJRefreshHeader {
    
    lazy var labelArray: Array = { () -> [UILabel] in
        var array = Array<UILabel>()
        return array
    }()
    
    lazy var customView: UIView = {
        let view = UIView()
        view.frame = self.frame
        let orginX = 25
        let width = 27
        
        for name in ["#","3","0","D","A","Y","S","S","W","I","F","T"].enumerated() {
            let label = UILabel(frame: CGRect(x: orginX + name.offset * width, y: 0, width: width, height: Int(self.frame.size.height)))
            label.text = name.element
            label.font = UIFont.init(name: "Avenir-Book", size: 20)
            label.textAlignment = .center
            view.addSubview(label)
            labelArray.append(label)
        }
        
        return view
    }()
    
    //MARK: 覆盖父类的方法
    override func prepare() {
        super.prepare()
        
        if self.subviews.contains(self.customView) == false {
            self.addSubview(self.customView)
        }
    }
    
    override var state: MJRefreshState{
        willSet{
            let oldState = self.state
            if state == oldState {
                return
            }
        }
        
        didSet{
            switch state {
            case .refreshing:
                for label in self.labelArray.enumerated(){
                    label.element.textColor = UIColor.red
                }
                
            default:
                for label in self.labelArray.enumerated(){
                    label.element.textColor = UIColor.black
                }
            }
        }
    }
    
    
}
