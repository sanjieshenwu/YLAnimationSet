//
//  ViewAnimationTransitionDisplay.swift
//  PodTest
//
//  Created by zyl on 2019/2/23.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

// Transition
let transitionLeft = 0
let transitionRight = 1
let transitionTop = 2
let transitionBottom = 3
let customviewanimation = 4
let viewToView = 5

class ViewAnimationTransitionDisplay: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["transitionLeft",
                    "transitionRight",
                    "transitionTop",
                    "transitionBottom",
                    "customView",
                    "viewToView"]
    
    var animationView = UIImageView.init()
    var myview = MyView.init()
    var label1 = UILabel.init()
    
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
        animationView.image = #imageLiteral(resourceName: "rabbit")
        bottomView.addSubview(animationView)
        
        myview.frame = CGRect(x: 100, y: 20, width: 40, height: 40)
        myview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bottomView.addSubview(myview)
        
        
        let labelBackView = UIView.init()
        labelBackView.frame = CGRect(x: 200, y: 20, width: 60, height: 60)
        labelBackView.backgroundColor = .black
        bottomView.addSubview(labelBackView)
        
        self.label1.frame = labelBackView.bounds
        self.label1.text = "Hello"
        self.label1.textColor = .white
        self.label1.textAlignment = NSTextAlignment.center
        self.label1.sizeToFit()
        self.label1.center = CGPoint(x: 30, y: 30)
        labelBackView.addSubview(self.label1)
        
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
        
        if indexPath.row == transitionLeft {
            display(UIView.AnimationOptions.transitionFlipFromLeft)
        } else if indexPath.row == transitionRight {
            display(UIView.AnimationOptions.transitionFlipFromRight)
        } else if indexPath.row == transitionTop {
            display(UIView.AnimationOptions.transitionFlipFromTop)
        } else if indexPath.row == transitionBottom {
            display(UIView.AnimationOptions.transitionFlipFromBottom)
        } else if indexPath.row == customviewanimation {
            customViewAnimation()
        } else if indexPath.row == viewToView {
            viewToViewAnimation()
        }
    }
    
    func display(_ options: UIView.AnimationOptions) {
        UIView.transition(with: self.animationView, duration: 1, options: options, animations: {
            if self.animationView.image == #imageLiteral(resourceName: "rabbit") {
                self.animationView.image = #imageLiteral(resourceName: "elephant")
            } else {
                self.animationView.image = #imageLiteral(resourceName: "rabbit")
            }
            
        }, completion: nil)
    }
    
    func viewToViewAnimation() {
        let label2 = UILabel(frame: self.label1.frame)
        label2.text = self.label1.text == "Hello" ? "World" : "Hello"
        label2.textColor = .white
        label2.sizeToFit()
        UIView.transition(from: self.label1, to: label2, duration: 1, options: .transitionFlipFromLeft, completion: {_ in
            self.label1 = label2
        })
    }
    
    func customViewAnimation() {
        self.myview.reverse = !self.myview.reverse
        UIView.transition(with: self.myview , duration: 0.6 , options: .transitionFlipFromLeft , animations: {
            self.myview.setNeedsDisplay()
        }, completion: nil)
    }
    
    @objc func stopAnimation() {
        self.animationView.transform = CGAffineTransform.identity
        self.animationView.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.1) {
            self.animationView.center = CGPoint(x: 40, y: 40)
        }
    }
}

class MyView: UIView {
    var reverse = false
    override func draw(_ rect: CGRect) {
        let f = self.bounds.insetBy(dx: 10, dy: 10)
        let context = UIGraphicsGetCurrentContext()
        if self.reverse {
            context?.strokeEllipse(in: f)
        }else{
            context?.stroke(f)
        }
    }
}
