//
//  SlideViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/08/05.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class SlideViewController: SlideMenuController {
    
    override func awakeFromNib() {
        let homeViewStoryboard: UIStoryboard = UIStoryboard(name: "HomeView",bundle:nil)
        let mainVC = homeViewStoryboard.instantiateViewController(withIdentifier: "HomeView")as! HomeViewController

        let slideMenuViewStoryboard: UIStoryboard = UIStoryboard(name: "SlideMenuView",bundle:nil)
        let leftVC = slideMenuViewStoryboard.instantiateViewController(withIdentifier: "SlideMenuView")as! SlideMenuViewController
        
        let navigationController = UINavigationController(rootViewController: mainVC)
        mainViewController = navigationController
        leftViewController = leftVC
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
