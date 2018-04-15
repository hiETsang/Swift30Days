//
//  ViewController.swift
//  Day14
//
//  Created by canoe on 2018/4/15.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height



class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pickerView : UIPickerView!
    var goButton : UIButton!
    var stateLabel : UILabel!
    
    var contentArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
        for _ in 0 ... 100 {
            self.dataArray1.append((Int)(arc4random() % 10))
            self.dataArray2.append((Int)(arc4random() % 10))
            self.dataArray3.append((Int)(arc4random() % 10))
        }
        
        pickerView.reloadAllComponents()
        
    }
    
    func createUI() {
        pickerView = UIPickerView()
        pickerView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 250)
        pickerView.center = self.view.center
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        
        goButton = UIButton.init(type: .custom)
        goButton.frame = CGRect.init(x: 50, y: pickerView.frame.maxY + 40, width: kScreenWidth - 100, height: 45)
        view.addSubview(goButton)
        goButton.backgroundColor = #colorLiteral(red: 1, green: 0.761015296, blue: 0, alpha: 1)
        goButton .setTitle("run", for: .normal)
        goButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        goButton.addTarget(self, action: #selector(goButtonClick), for: .touchUpInside)
        goButton.clipsToBounds = true
        goButton.layer.cornerRadius = 6
        
        stateLabel = UILabel.init(frame: CGRect.init(x: 0, y: goButton.frame.maxY + 20, width: kScreenWidth, height: 40))
        view.addSubview(stateLabel)
        stateLabel.textAlignment = .center
        stateLabel.font = UIFont.systemFont(ofSize: 20)
        stateLabel.text = "💔"
    }
    
    @objc func goButtonClick() {
        self.pickerView.selectRow(Int(arc4random()%90) + 3, inComponent: 0, animated: true)
        self.pickerView.selectRow(Int(arc4random()%90) + 3, inComponent: 1, animated: true)
        self.pickerView.selectRow(Int(arc4random()%90) + 3, inComponent: 2, animated: true)
        
        if (dataArray1[self.pickerView.selectedRow(inComponent: 0)] == dataArray2[self.pickerView.selectedRow(inComponent: 1)] && dataArray2[self.pickerView.selectedRow(inComponent: 1)] == dataArray3[self.pickerView.selectedRow(inComponent: 2)]) {
            stateLabel.text = "中奖啦！"
        }else
        {
            stateLabel.text = "💔"
        }
        
    }
    
    //MARK: - pickerViewDelegate&dataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        
        switch component {
        case 0:
            label.text = self.contentArray[self.dataArray1[row]]
        case 1:
            label.text = self.contentArray[self.dataArray2[row]]
        case 2:
            label.text = self.contentArray[self.dataArray3[row]]
        default: break
        }
        label.font = UIFont.init(name: "Apple Color Emoji", size: 80)
        label.textAlignment = .center
        return label
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

