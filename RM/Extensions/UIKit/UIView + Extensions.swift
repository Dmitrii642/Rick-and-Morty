//
//  UIView + Extensions.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
    }
    
    func addShadowOnView() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1
        layer.cornerRadius = 2
        
    }
    
}
