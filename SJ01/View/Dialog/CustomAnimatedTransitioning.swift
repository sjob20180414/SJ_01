//
//  CustomAnimatedTransitioning.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/08/05.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

final class CustomAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresent: Bool
    let at: [CGFloat]
    
    init(isPresent: Bool, at: [CGFloat]) {
        self.isPresent = isPresent
        self.at = at
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            animatePresentTransition(transitionContext: transitionContext)
        } else {
            animateDissmissalTransition(transitionContext: transitionContext)
        }
    }
    
    func animatePresentTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let presentingController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let presentedController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let containerView: UIView = transitionContext.containerView
            else {
                return
            }
        
        presentedController.view.layer.cornerRadius = 4.0
        presentedController.view.clipsToBounds = true
        presentedController.view.alpha = 0.0
        presentedController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        containerView.insertSubview(presentedController.view, belowSubview: presentingController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .curveLinear, animations: {
            presentedController.view.alpha = 1.0
            presentedController.view.frame.origin.x = containerView.bounds.size.width -
                self.at[0]
            presentedController.view.frame.origin.y = containerView.bounds.size.height -
                self.at[1]
            presentedController.view.transform = CGAffineTransform.identity
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
    func animateDissmissalTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .curveLinear, animations:{
            presentedController.view.alpha = 0.0
            presentedController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            presentedController.view.frame.origin.x = self.at[0]
            presentedController.view.frame.origin.y = self.at[1]
            
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
}
