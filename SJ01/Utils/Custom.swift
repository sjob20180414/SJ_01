//
//  Custom.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import UIKit

// Custom Button
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
