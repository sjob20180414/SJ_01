//
//  LoginViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

class LoginViewController: SuperViewController {
    
    var leftBarButton: UIBarButtonItem!
    var rightBarButton: UIBarButtonItem!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ログイン"
        self.idTextField.placeholder = "ID"
        self.passwordTextField.placeholder = "パスワード"
        
        setNavigationButton(vc: self, type: .login)
        self.view.backgroundColor = UIColor.white
        
        // 通信試験
        //self.loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func LoginButtonTap(_ sender: Any) {
        presentHomeView()
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

