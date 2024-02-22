//
//  TRHNetworkError.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

enum TRHNetworkError {
    case wrongURLRequestError
    case badRequestError
    case requestFail(code: String, message: String)
}

extension TRHNetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongURLRequestError: return NSLocalizedString("Wrong URL Request Error", comment: "")
        case .badRequestError: return NSLocalizedString("Bad Request Error", comment: "")
        case let .requestFail(_, message): return NSLocalizedString(message, comment: "")
        }
    }
}
