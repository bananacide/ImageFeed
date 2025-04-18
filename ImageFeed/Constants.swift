//
//  Constants.swift
//  ImageFeed
//
//  Created by Алексей Витценко on 13.04.2025.
//

import UIKit

enum Constants {
    static let accessKey = "qe-6GNPFPBKZxbNsbK_hZ4FICi2tvCtSKSkF8O2Nkpk"
    static let secretKey = "6_JoMBnQmUnJj1RB_SHLRYnhuCr1LbED_kCDz1cZaDs"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    
    static let defaultBaseURL: URL = {
        guard let url = URL(string: "https://api.unsplash.com") else {
            assertionFailure("Невозможно создать URL из строки.")
            return URL(fileURLWithPath: "")
        }
        return url
    }()
}
