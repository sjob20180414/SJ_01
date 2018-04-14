//
//  LoginViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var leftBarButton: UIBarButtonItem!
    var rightBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ログイン"
        
        leftBarButton = UIBarButtonItem(title: "<", style: .plain, target: self, action: nil)//#selector(LoginViewController.tappedLeftBarButton))
        
        rightBarButton = UIBarButtonItem(title: ">", style: .plain, target: self, action: nil)//#selector(LoginViewController.tappedRightBarButton))
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        self.view.backgroundColor = UIColor.white
        
        // 通信試験
        //self.loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadAddressURL() {
        DataManager().fetchUser(completion: {(success, data) in
            if success {
                print(data?.id)
                print(data?.name)
                print(data?.createdAt)
            } else {
                
            }
        })
    }
}

