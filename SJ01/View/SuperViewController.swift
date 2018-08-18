//
//  SuperViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/06/23.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

class SuperViewController: UIViewController {
    
    var at: [CGFloat] = [0, 0]
    
    enum NaviButtonType {
        case none
        case login
        case home
        case weeklyReport
        case notice
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // TODO :
    func setNavigationButton(vc: UIViewController, type : NaviButtonType) {
        
        vc.navigationController?.navigationBar.barTintColor = UIColor.white
        vc.navigationController?.navigationBar.tintColor = COlOR_MAIN
        vc.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : COlOR_MAIN,
            NSAttributedStringKey.font: UIFont(name: BASE_FONT, size: 40)!]
        vc.navigationController?.navigationBar.frame =
            CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 280)
        at = [vc.view.frame.size.width / 2, vc.view.frame.size.height / 2]
        
        switch type {
        case .home:
            let rightBarButton = UIBarButtonItem(title: "設定", style: .plain, target: self, action: #selector(SuperViewController.tappedSlideMenuButton))
            rightBarButton.setTitleTextAttributes(
                [NSAttributedStringKey.font: UIFont(name: BASE_FONT, size: 18)!], for: .normal
            )
            vc.navigationItem.rightBarButtonItem = rightBarButton
            break
        case .weeklyReport, .notice:
            let leftBarButton = UIBarButtonItem(title: "戻る", style: .plain, target: self, action: #selector(SuperViewController.tappedLeftBarButton))
            leftBarButton.setTitleTextAttributes(
                [NSAttributedStringKey.font: UIFont(name: BASE_FONT, size: 18)!], for: .normal
            )
            vc.navigationItem.leftBarButtonItem = leftBarButton
        default:
            break
        }
    }
    
    @objc func tappedLeftBarButton() {
        
    }
    
    @objc func tappedSlideMenuButton() {
        self.slideMenuController()?.openLeft()
    }
    
    func presentHomeView() {
        let homeViewStoryboard: UIStoryboard = UIStoryboard(name: "HomeView",bundle:nil)
        let mainVC = homeViewStoryboard.instantiateViewController(withIdentifier: "HomeView")as! HomeViewController
        mainVC.modalTransitionStyle = .flipHorizontal
        let slideMenuViewStoryboard: UIStoryboard = UIStoryboard(name: "SlideMenuView",bundle:nil)
        let leftVC = slideMenuViewStoryboard.instantiateViewController(withIdentifier: "SlideMenuView")as! SlideMenuViewController
        let navigationController = UINavigationController(rootViewController: mainVC)
        let slideMenuController = SlideMenuController(mainViewController: navigationController, leftMenuViewController: leftVC)
        self.present(slideMenuController,animated: true, completion: nil)
    }
 
    func testDialog(sender: UIButton) {
        let dialogViewStoryboard: UIStoryboard = UIStoryboard(name: "DialogView",bundle:nil)
        let dialogViewController = dialogViewStoryboard.instantiateViewController(withIdentifier: "DialogView")as! DialogViewController
        dialogViewController.modalPresentationStyle = .custom
        dialogViewController.transitioningDelegate = self
        self.present(dialogViewController, animated: true, completion: nil)
    }
}

extension SuperViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension SuperViewController {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimatedTransitioning(isPresent: true, at: at)
    }
    
    func animationController(forDismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimatedTransitioning(isPresent: false, at: at)
    }
}
