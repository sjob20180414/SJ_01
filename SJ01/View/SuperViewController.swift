//
//  SuperViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/06/23.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class SuperViewController: UIViewController {
    
    enum NaviButtonType {
        case none
        case login
        case home
    }
    
    // TODO :
    func setNavigationButton(vc: UIViewController, type : NaviButtonType) {
        let leftBarButton = UIBarButtonItem(title: "<", style: .plain, target: self, action: nil)//#selector(LoginViewController.tappedLeftBarButton))
        
        let rightBarButton = UIBarButtonItem(title: ">", style: .plain, target: self, action: nil)//#selector(LoginViewController.tappedRightBarButton))
        
        vc.navigationController?.navigationBar.barTintColor = UIColor.white
        vc.navigationController?.navigationBar.tintColor = COlOR_MAIN
        vc.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : COlOR_MAIN,
            NSAttributedStringKey.font: UIFont(name: BASE_FONT, size: 25)!]
        vc.navigationController?.navigationBar.frame =
            CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 280)
        
        vc.navigationItem.leftBarButtonItem = leftBarButton
        vc.navigationItem.rightBarButtonItem = rightBarButton
    }
}
