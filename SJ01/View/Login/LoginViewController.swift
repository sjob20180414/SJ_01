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
import GoogleSignIn

class LoginViewController: SuperViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var googleSingInButton: UIButton!
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
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes = GOOGLE_API_SCOPES
        
        // 通信試験
        //self.loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func LoginButtonTap(_ sender: Any) {
        presentHomeView()
    }
    
    @IBAction func googleSingInTap(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func test(_ sender: Any) {
        self.loadAddressURL()
    }
    
    private func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
    }
    
    // Present a view that prompts the user to sign in with Google
    private func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    private func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userData = User()
            userData.googleUserID = user.userID
            userData.googleIdToken = user.authentication.idToken
            userData.googleFullName = user.profile.name
            userData.googleGivenName = user.profile.givenName
            userData.googleFamilyName = user.profile.familyName
            userData.googleEmail = user.profile.email
            
            userData.insertOrUpdate()
            
            user.authentication.getTokensWithHandler { (auth, error) in
                guard error == nil else {
                    debugPrint(
                        "Error getting auth token: \(String(describing: error))"
                    )
                    return
                }
//                DataManager().fetchGmailList(accessToken: (auth?.accessToken)!, completion: {(success) in
//                    if success {
//                    } else {
//
//                    }
//                })
            }
        }
    }
    
    func loadAddressURL() {
        
        let userModel = LocalDataManager<User>()
        
//        DataManager().fetchUser(completion: {(success, data) in
//            if success {
//                print(data?.id)
//                print(data?.name)
//                print(data?.createdAt)
//            } else {
//
//            }
//        })
//        let userId = userModel.fetchFirst()?.googleUserID
//        DataManager().fetchGmailList(accessToken: userId!, completion: {(success) in
//            if success {
//            } else {
//
//            }
//        })
    }
}

