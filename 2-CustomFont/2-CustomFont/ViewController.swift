//
//  ViewController.swift
//  2-CustomFont
//
//  Created by weirenxin on 2016/12/23.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    
    private var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    private var fonRowIndex = 0
    
    @IBOutlet weak var fontTableView: UITableView!
    @IBOutlet weak var changeFontButton: UIButton!
    @IBAction func changeFontDidTouch(_ sender: Any) {
        fonRowIndex = (fonRowIndex + 1) % 5
        print(fontNames[fonRowIndex])
        fontTableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
        changeFontButton.layer.cornerRadius = 5.0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontNames[fonRowIndex], size: 16)

        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

