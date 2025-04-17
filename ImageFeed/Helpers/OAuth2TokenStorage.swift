//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 17.04.2025.
//

import UIKit

class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()
    
    private let tokenKey = "OAuthToken"
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
}
