//
//  ViewAnimationTransformDisplay.swift
//  PodTest
//
//  Created by zyl on 2019/2/23.
//  Copyright © 2019 zyl. All rights reserved.
//

import UIKit

// Transform
let translated = 0
let rotated = 1
let scaled = 2
let combination = 3
let spring = 4 // 弹性动画
let Keyframe = 5 // 关键帧动画

class ViewAnimationTransformDisplay: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataList = ["translated",
                    "rotated",
                    "scaled",
                    "combination",
                    "spring",
                    "keyframe"]
    
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
        animationView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
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
        
        if indexPath.row == translated {
            UIView.animate(withDuration: 1) {
                self.animationView.transform = CGAffineTransform.identity
                    .translatedBy(x: 100, y: 0)
            }
        } else if indexPath.row == rotated {
            UIView.animate(withDuration: 1) {
                self.animationView.transform = CGAffineTransform.identity
                    .rotated(by: CGFloat(Double.pi/4))
            }
        } else if indexPath.row == scaled {
            UIView.animate(withDuration: 1) {
                self.animationView.transform = CGAffineTransform.identity
                    .scaledBy(x: 0.5, y: 0.5)
            }
        } else if indexPath.row == combination {
            UIView.animate(withDuration: 1) {
                self.animationView.transform = CGAffineTransform.identity
                    .translatedBy(x: 100, y: 100)
                    .rotated(by: CGFloat(Double.pi/4))
                    .scaledBy(x: 0.5, y: 0.5)
            }
        } else if indexPath.row == spring {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 8, options: [], animations: {
                self.animationView.center.x += 100
            }, completion: nil)
        } else if indexPath.row == Keyframe {
            self.keyFrameAnimation()
        }
    }
    
    @objc func stopAnimation() {
        self.animationView.transform = CGAffineTransform.identity
        self.animationView.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.1) {
            self.animationView.center = CGPoint(x: 40, y: 40)
        }
    }
    
    func keyFrameAnimation() {
        var p = self.animationView.center
        let dur = 0.25
        var start = 0.0
        let dx: CGFloat = 100
        let dy: CGFloat = 50
        var dir: CGFloat = 1
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: dur, animations: {
                p.x += dx * dir
                p.y += dy
                self.animationView.center = p
            })
            start += dur
            dir *= -1
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: dur, animations: {
                p.x += dx * dir
                p.y += dy
                self.animationView.center = p
            })
            start += dur
            dir *= -1
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: dur, animations: {
                p.x += dx * dir
                p.y += dy
                self.animationView.center = p
            })
            start += dur
            dir *= -1
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: dur, animations: {
                p.x += dx * dir
                p.y += dy
                self.animationView.center = p
            })
        }, completion: nil)
    }
}
