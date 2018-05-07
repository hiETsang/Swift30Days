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
    var dataArray : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataArray = ["1","2","3","4","5"]
        self.createUI()
    }
    
    func createUI() {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: self.view.frame.size.width - 40, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0)
        
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.iconImageView.image = UIImage(named: self.dataArray[indexPath.row] as! String)
        
        cell.backButtonTapped = { currentCell in
            collectionView.reloadItems(at: [indexPath])
            collectionView.isScrollEnabled = true
            currentCell.fullScreen = false
//            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
//                currentCell.frame = collectionView.frame
//            }) { (finish) in
//                collectionView.isScrollEnabled = true
//                currentCell.fullScreen = false
//            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.superview?.bringSubview(toFront: cell)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            cell.frame = collectionView.frame
        }) { (finish) in
            collectionView.isScrollEnabled = false
            cell.fullScreen = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

