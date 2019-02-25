//
//  ImageViewAnimationDisplay.swift
//  PodTest
//
//  Created by zyl on 2019/2/23.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

class ImageViewAnimationDisplay: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["animationImages",
                    "animatedResizableImageNamed",
                    "redPoint"]
    
    var animationView = UIImageView.init()
    
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
        
        if indexPath.row == 0 {
            startAnimation()
        } else if indexPath.row == 1 {
            startAnimation2()
        } else if indexPath.row == 2 {
            startAnimation3()
        }
    }
    
    func startAnimation() {
        let rabbit = #imageLiteral(resourceName: "rabbit")
        UIGraphicsBeginImageContextWithOptions(rabbit.size, false, 0)
        let empty = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let arr = [rabbit, empty, rabbit, empty, rabbit]
        animationView.animationImages = arr
        animationView.animationDuration = 2
        animationView.animationRepeatCount = 0
        animationView.image = arr[0];
        self.animationView.startAnimating()
    }
    
    func startAnimation2() {
        let image = UIImage.animatedImageNamed("ying", duration: 2)
        animationView.image = image
    }
    
    func startAnimation3() {
        var arr = [UIImage]()
        let w: CGFloat = 18
        for i in 1 ..< 6 {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: w, height: w), false, 0)
            let context = UIGraphicsGetCurrentContext()!
            context.setFillColor(UIColor.red.cgColor)
            let ii = CGFloat(i)
            print(ii)
            let rect = CGRect(x: ii, y: ii, width: w-ii*2, height: w-ii*2)
            context.addEllipse(in: rect)
            context.fillPath()
            let im = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            arr.append(im)
        }
        let im = UIImage.animatedImage(with: arr, duration: 5)
        self.animationView.image = im
    }
    
    @objc func stopAnimation() {
        self.animationView.stopAnimating()
        UIView.animate(withDuration: 0.1) {
            self.animationView.center = CGPoint(x: 40, y: 40)
        }
    }
}
