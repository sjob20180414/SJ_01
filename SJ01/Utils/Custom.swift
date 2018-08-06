//
//  Custom.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}

@IBDesignable class CustomView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}

@IBDesignable class SlideMenuCustomView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [
            .bottomRight
            ], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.clipsToBounds = (cornerRadius > 0)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}

@IBDesignable class SlideMenuCustomFooterView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [
            .topRight
            ], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.clipsToBounds = (cornerRadius > 0)
        
        super.draw(rect)
    }
}

@IBDesignable class SlideMenuListCustomButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [
            .bottomRight
            ], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.clipsToBounds = (cornerRadius > 0)
        
        super.draw(rect)
    }
}

@IBDesignable class SlideMenuCustomLogoutButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [
            .topRight
            ], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.clipsToBounds = (cornerRadius > 0)
        
        super.draw(rect)
    }
}

@IBDesignable class DialogCustomView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [
            .topLeft,
            .topRight
            ], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.clipsToBounds = (cornerRadius > 0)
        
        super.draw(rect)
    }
}

@IBDesignable class DialogCustomMessageView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [
            .bottomRight,
            .bottomLeft
            ], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.clipsToBounds = (cornerRadius > 0)
        
        super.draw(rect)
    }
}
