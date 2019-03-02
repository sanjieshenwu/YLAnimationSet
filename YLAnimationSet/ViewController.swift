//
//  ViewController.swift
//  YLAnimationSet
//
//  Created by zyl on 2019/2/25.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["UIView Animation",
                    "OCAnimation",
                    "AppStoreHomeVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift Animation"
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "IDENTIFIER"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        let str = dataList[indexPath.row]
        cell?.textLabel?.text = str
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = ViewAnimationVC.init()
            vc.title = dataList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let vc = YLOCViewAnimationVC.init()
            vc.title = dataList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let vc = AppStoreHomeVC.init()
            vc.title = dataList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

