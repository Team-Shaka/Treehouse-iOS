//
//  TreehouseURLContainer.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

enum TreehouseURLKey: String {
    case baseUrl = "treehouse"
}

final class TreehouseURLContainer {
    private init() { }
    
    /// Treehouse URL function
    ///  - Parameter key: treehouseUrlKey
    ///  - Returns: URL
    static func url(key: TreehouseURLKey) -> URL {
        #if DEBUG
        guard let fileUrl = Bundle.main.url(forResource: "url-debug", withExtension: "plist") else { fatalError("DOSEN'T EXIST URL FILE") }
        #else
        guard let fileUrl = Bundle.main.url(forResource: "url", withExtension: "plist") else { fatalError("DOSEN'T EXIST URL FILE") }
        #endif
        guard let urlDictionary = NSDictionary(contentsOf: fileUrl) else { fatalError("DOSEN'T EXIST URL KEY") }
        guard let urlString = urlDictionary[key.rawValue] as? String else { fatalError("COULDN'T CONVERT TO STRING") }
        guard let url = URL(string: urlString) else { fatalError("COULDN'T CREATE URL") }

        return url
    }
    
    /// Treehouse URL Request function
    /// - Parameter key: treehouseUrlKey
    /// - Returns: URLRequest
    static func urlRequest(key: TreehouseURLKey) -> URLRequest {
        let url = TreehouseURLContainer.url(key: key)
        return URLRequest(url: url)
    }
}
