//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 28.03.2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let namelabel = UILabel()
    private let loginNamelabel = UILabel()
    private let descriptionlabel = UILabel()
    private let avatar = UIImageView()
    private let exitButton = UIButton()
        
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
        setupAvatar()
        exitButton.setupButtonWithImage(image: "button_exit")
                
        let stackView = UIStackView(arrangedSubviews: [avatar, exitButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.heightAnchor.constraint(equalToConstant: 70),
            avatar.widthAnchor.constraint(equalToConstant: 70),
            exitButton.heightAnchor.constraint(equalToConstant: 44),
            exitButton.widthAnchor.constraint(equalToConstant: 44)
        ])
        
        return stackView
    }
    
    private func labelsStack() -> UIStackView {
        namelabel.setupLabel(text: "Екатерина Новикова", size: 23, weight: .bold, color: .ypWhite)
        loginNamelabel.setupLabel(text: "@ekaterina_nov", size: 13, weight: .regular, color: .ypGray)
        descriptionlabel.setupLabel(text: "Hello, world!", size: 13, weight: .regular, color: .ypWhite)
        
        let stackView = UIStackView(arrangedSubviews: [namelabel, loginNamelabel, descriptionlabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    private func setupAvatar() {
        avatar.image = UIImage(named: "User_pic")
        avatar.contentMode = .scaleAspectFit
        avatar.translatesAutoresizingMaskIntoConstraints = false
    }
}
