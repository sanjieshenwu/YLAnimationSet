//
//  ViewAnimationOptionsDisplay.swift
//  PodTest
//
//  Created by zyl on 2019/2/23.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

let autoreverse = 0
let animationRepeat = 1
let curveEaseInOut = 2
let curveEaseIn = 3
let curveEaseOut = 4
let curveLinear = 5
// options
class ViewAnimationOptionsDisplay: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["UIViewAnimationOptions.autoreverse",
                    "UIViewAnimationOptions.repeat",
                    "curveEaseInOut",
                    "curveEaseIn",
                    "curveEaseOut",
                    "curveLinear"]
    
    var animationView = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        var frame = view.bounds
        frame.size.height = ScreenHeight / 2.0
        let tableView = UITableView.init(frame: frame, style: .plain)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        let bottomView = UIView.init()
        bottomView.frame = CGRect(x: 0, y: frame.size.height, width: ScreenWidth, height: 300)
        self.view.addSubview(bottomView)
        
        animationView.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
        animationView.backgroundColor = UIColor.green
        bottomView.addSubview(animationView)
        
        let item = UIBarButtonItem(title: "Stop", style: UIBarButtonItem.Style.plain, target: self, action: #selector(stopAnimation))
        self.navigationItem.rightBarButtonItem = item;
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
        
        if indexPath.row == autoreverse {
            display(.autoreverse)
        } else if indexPath.row == animationRepeat {
            display(.repeat)
        } else if indexPath.row == curveEaseInOut {
            display(.curveEaseInOut)
        } else if indexPath.row == curveEaseIn {
            display(.curveEaseIn)
        } else if indexPath.row == curveEaseOut {
            display(.curveEaseOut)
        } else if indexPath.row == curveLinear {
            display(.curveLinear)
        }
    }
    
    func display(_ options: UIView.AnimationOptions) {
        let centerX = self.animationView.center.x;
        UIView.animate(withDuration: 1, delay: 0, options: options, animations: {
            UIView.setAnimationRepeatAutoreverses(true)
            self.animationView.center.x += 200
        }, completion: { _ in
            self.animationView.center.x = centerX
        })
    }
    
    
    @objc func stopAnimation() {
        self.animationView.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.1) {
            self.animationView.center = CGPoint(x: 40, y: 40)
        }
    }
}
