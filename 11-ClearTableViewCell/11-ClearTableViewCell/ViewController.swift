//
//  ViewController.swift
//  11-ClearTableViewCell
//
//  Created by weirenxin on 2017/1/3.
//  Copyright © 2017年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    private var tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        
        view.backgroundColor = UIColor.black
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    private func colorForIndex(_ index: Int) -> UIColor {
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

