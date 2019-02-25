//
//  ViewAnimationVC.swift
//  PodTest
//
//  Created by zyl on 2019/2/19.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

class ViewAnimationVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["VisualViewDisplay",
                    "ViewAnimationOptionsDisplay",
                    "ViewAnimationTransformDisplay",
                    "ViewAnimationTransitionDisplay",
                    "ImageViewAnimationDisplay"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let classStr = self.dataList[indexPath.row]
        // “项目名” + “.” + “类名” 获取类
        let projectName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        let viewC = NSClassFromString(projectName! + "." + classStr) as! BaseViewController.Type
        let vc = viewC.init()
        vc.title = classStr
        self.navigationController?.pushViewController(vc, animated: true)
    }
}











