//
//  Const.swift
//  PodTest
//
//  Created by zyl on 2019/2/19.
//  Copyright © 2019 zyl. All rights reserved.
//

import Foundation
import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height
let StatusBarHeight = UIApplication.shared.statusBarFrame.size.height

func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
