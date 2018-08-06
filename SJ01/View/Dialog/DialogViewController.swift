//
//  DialogViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/08/05.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class DialogViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func dismissDialog(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
