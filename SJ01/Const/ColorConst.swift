//
//  ColorConst.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/06/23.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

// Main Color
let COlOR_MAIN = UIColor(hex: "FA966E")
let BASE_FONT = "cinecaption"

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
