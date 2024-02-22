//
//  TreehouseNetworkResult.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

struct TreehouseNetworkResult<T: Codable>: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let createdAt: String
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess
        case code
        case message
        case createdAt
        case data
    }
}
