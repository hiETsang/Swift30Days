//
//  ViewController.swift
//  Day05
//
//  Created by canoe on 2018/3/12.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var dataArray = Model.getModels()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createUI()
    }
    
    func createUI() {
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        imageView.image = UIImage.init(named: "blue")
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize.init(width: 300, height: 400)
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 500), collectionViewLayout: layout)
        collectionView.center = view.center
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.model = dataArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

