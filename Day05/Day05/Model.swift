//
//  Model.swift
//  Day05
//
//  Created by canoe on 2018/3/12.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class Model: NSObject {
    var imageName = ""
    var title = ""
    var desc = ""
    
    
    init(title:String,imageName:String,desc:String){
        self.title = title
        self.imageName = imageName
        self.desc = desc
    }
    
    static func getModels() -> [Model] {
        return [
        Model.init(title: "嘿，今天如何啊", imageName: "hello", desc: "虽然我今天过的不怎么样，但是希望你好"),
        Model.init(title: "嘿，今天如何啊", imageName: "dudu", desc: "虽然我今天过的不怎么样，但是希望你好"),
        Model.init(title: "嘿，今天如何啊", imageName: "bodyline", desc: "虽然我今天过的不怎么样，但是希望你好"),
        Model.init(title: "嘿，今天如何啊", imageName: "wave", desc: "虽然我今天过的不怎么样，但是希望你好"),
        Model.init(title: "嘿，今天如何啊", imageName: "darkvarder", desc: "虽然我今天过的不怎么样，但是希望你好"),
        Model.init(title: "嘿，今天如何啊", imageName: "hhhhh", desc: "虽然我今天过的不怎么样，但是希望你好")]
    }
    
}
