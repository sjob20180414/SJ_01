//
//  CustomNavigationBar.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/06/23.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 55)
    }
}
