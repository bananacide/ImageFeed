//
//  SplashViewController.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 17.04.2025.
//

import UIKit

final class SplashViewController: UIViewController {
    
    private let oauth2Service = OAuth2Service.shared
    private let oauth2TokenStorage = OAuth2TokenStorage.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let _ = oauth2TokenStorage.token {
            switchToTabBarController()
        } else {
            showAuthenticationScreen()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    private func showAuthenticationScreen() {
        let authViewController = AuthViewController()
        authViewController.delegate = self
        let navController = UINavigationController(rootViewController: authViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }


    private func switchToTabBarController() {
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            let tabBarController = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "TabBarViewController")
            sceneDelegate.window?.rootViewController = tabBarController
        } else {
            fatalError("Неверная конфигурация")
        }
    }
}

extension SplashViewController: AuthViewControllerDelegate {
    func authViewController(_ vc: AuthViewController, didAuthenticateWithCode code: String) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.fetchOAuthToken(code)
        }
    }

    func fetchOAuthToken(_ code: String) {
        oauth2Service.fetchOAuthToken(code: code) { [weak self] (result: Result<String, Error>) in
            guard let self = self else { return }
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.switchToTabBarController()
                }
            case .failure:
                break
            }
        }
    }
}

