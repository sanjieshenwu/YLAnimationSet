//
//  VisualViewDisplay.swift
//  PodTest
//
//  Created by zyl on 2019/2/23.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

// 模糊视图
class VisualViewDisplay: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["UIBlurEffectStyleDark",
                    "UIBlurEffectStyleExtraLight",
                    "UIBlurEffectStyleLight",
                    "UIBlurEffectStyleProminent",
                    "UIBlurEffectStyleRegular"]
    var visualView = UIVisualEffectView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        let bottomView = UIView.init()
        bottomView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 300)
        let imageView = UIImageView.init(frame: CGRect(x: 20, y: 20, width: ScreenWidth - 40, height: 260))
        imageView.image = UIImage(named: "back_image")
        bottomView.addSubview(imageView)
        tableView.tableFooterView = bottomView
        
        self.visualView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.visualView.center = imageView.center
        bottomView.addSubview(visualView)
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
            display(.dark)
        } else if indexPath.row == 1 {
            display(.extraLight)
        } else if indexPath.row == 2 {
            display(.light)
        } else if indexPath.row == 3 {
            display(.prominent)
        } else if indexPath.row == 4 {
            display(.regular)
        }
    }
    
    func display(_ style: UIBlurEffect.Style) {
        self.visualView.effect = nil
        let effect = UIBlurEffect(style: style)
        UIView.animate(withDuration: 1) {
            self.visualView.effect = effect
        }
    }
}
