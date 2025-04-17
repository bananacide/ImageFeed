//
//  UIButton+Extensions.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 15.04.2025.
//

import UIKit

extension UIButton {
    func setupButtonWithImage(image: String) {
        self.setImage(UIImage(named: image), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    func setupButton(title: String, textColor: UIColor, background: UIColor, size: CGFloat, weight: UIFont.Weight, radius: CGFloat) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = background
        self.titleLabel?.font = .systemFont(ofSize: size, weight: weight)
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
