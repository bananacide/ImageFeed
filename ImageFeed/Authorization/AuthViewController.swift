//
//  AuthorizationViewController.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 15.04.2025.
//

import  UIKit

protocol AuthViewControllerDelegate: AnyObject {
    func authViewController(_ vc: AuthViewController, didAuthenticateWithCode code: String)
}

final class AuthViewController: UIViewController, WebViewViewControllerDelegate {
    
    private let button = UIButton()
    
    weak var delegate: AuthViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        
        setupIconUnsplash()
        setupButton()
        configureBackButton()
    }
    
    func authenticateUser(withCode code: String) {
        delegate?.authViewController(self, didAuthenticateWithCode: code)
    }
    
    private func setupIconUnsplash() {
        let icon = UIImageView()
        icon.image = UIImage(named: "icon_unsplash")
        
        view.addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 60),
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupButton() {
        button.setupButton(title: "Войти", textColor: .ypBlack, background: .ypWhite, size: 17, weight: .bold, radius: 16)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 48),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90)
        ])
    }
    
    @objc private func loginButtonTapped() {
        let webVC = WebViewViewController()
        webVC.delegate = self
        navigationController?.pushViewController(webVC, animated: true)
    }
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back_button")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back_button")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "ypBlack")
    }
    
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        OAuth2Service.shared.fetchOAuthToken(code: code) { [weak self] result in
            switch result {
            case .success(let token):
                print("Успешно получен токен: \(token)")
                self?.authenticateUser(withCode: token)
            case .failure(let error):
                print("Ошибка при получении токена: \(error.localizedDescription)")
            }
        }
    }

    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        navigationController?.popViewController(animated: true)
    }
}
