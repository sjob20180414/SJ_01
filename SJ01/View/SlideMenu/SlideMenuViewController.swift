//
//  SlideMenuViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/08/05.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class SlideMenuViewController: UIViewController {
    
    @IBOutlet weak var verLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ver = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        verLabel.text = "Version " + ver!
    }
    
    @IBAction func logoutButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
