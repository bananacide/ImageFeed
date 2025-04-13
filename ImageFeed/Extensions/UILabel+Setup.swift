//
//  UILabel+Setup.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 13.04.2025.
//

import UIKit

extension UILabel {
    func setupLabel(text: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
    }
}
