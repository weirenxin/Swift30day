//
//  ViewController.swift
//  7-PullToRefresh
//
//  Created by weirenxin on 2016/12/28.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let cellIdentifer = "NewCellIdentifier"
    private let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    private let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    private var emojiData = [String]()
    
    private lazy var emojiTableView: UITableView = {[weak self] in
        let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        
        tableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self!.cellIdentifer)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60.0
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        refreshControl.tintColor = UIColor.white
    
        return refreshControl
    }()
    
    private lazy var navBar: UINavigationBar =  {
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
        navBar.barStyle = .blackTranslucent
//        navBar.
        
        return navBar
    }()
    
    @objc func didReloadEmoji() {
        emojiData = newFavoriteEmoji
        emojiTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiData = favoriteEmoji
        
        refreshControl.addTarget(self, action:#selector(ViewController.didReloadEmoji), for: .valueChanged)
        emojiTableView.refreshControl = self.refreshControl
        
        view.addSubview(emojiTableView)
        view.addSubview(navBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = .center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }

}

