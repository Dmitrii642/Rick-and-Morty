//
//  UILabel + Extensions.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, font: UIFont?) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
