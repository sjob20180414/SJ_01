//
//  HomeViewController.swift
//  SJ01
//
//  Created by Yudai Terashita on 2018/05/27.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: SuperViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "HOME"
        setNavigationButton(vc: self, type: .home)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



