//
//  User.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

struct User: Codable {
    let userId: Int
    let accessToken: String
    let refreshToken: String
}
