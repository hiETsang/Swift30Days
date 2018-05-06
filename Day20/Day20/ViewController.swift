//
//  ViewController.swift
//  Day20
//
//  Created by canoe on 2018/5/5.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var collectionView : UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
    }
    
    func createUI() {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: self.view.frame.size.width - 40, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: <#T##UICollectionViewLayout#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

