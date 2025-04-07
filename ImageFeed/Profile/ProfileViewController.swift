//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 28.03.2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        createProfile()
    }
    
    
    private func createProfile() {
        let avaterAndExitButtonStack = avaterAndExitButtonStack()
        let labelsStack = labelsStack()
        
        let stackView = UIStackView(arrangedSubviews: [avaterAndExitButtonStack, labelsStack])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func avaterAndExitButtonStack() -> UIStackView {
        let avatar = setupImageView()
        let button = setupButton()
                
        let stackView = UIStackView(arrangedSubviews: [avatar, button])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.heightAnchor.constraint(equalToConstant: 70),
            avatar.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 44)
        ])
        
        return stackView
    }
    
    private func labelsStack() -> UIStackView {
        let namelabel = UILabel()
        namelabel.setupLabel(text: "Екатерина Новикова", size: 23, weight: .bold, color: .ypWhite)
        
        let loginNamelabel = UILabel()
        loginNamelabel.setupLabel(text: "@ekaterina_nov", size: 13, weight: .regular, color: .ypGray)
        
        let descriptionlabel = UILabel()
        descriptionlabel.setupLabel(text: "Hello, world!", size: 13, weight: .regular, color: .ypWhite)
        
        let stackView = UIStackView(arrangedSubviews: [namelabel, loginNamelabel, descriptionlabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    private func setupImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "User_pic")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    private func setupButton() -> UIButton {
        let button = UIButton()
        button.tintColor = .ypWhite
        button.setImage(UIImage(named: "button_exit"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }
    
}

// я решил сдеалть это через расгирение, в будущем можно будет вынести его отдельно и использовать и для второго экрана когда будет верстать все приложение кодом
extension UILabel {
    func setupLabel(text: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
    }
}
