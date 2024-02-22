//
//  TreehouseNetworkManager.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation
import Alamofire

final class TreehouseNetworkManager: TRHNetworkManager {
    static let shared: TreehouseNetworkManager = TreehouseNetworkManager()
    private init() { }
    
    @UserDefaultWrapper(key: .member, defaultValue: nil)
    var user: User?
}

extension TreehouseNetworkManager {
    func fetchFeed(treeId: Int,
                   completion: @escaping (_ value: FeedData?, _ error: Error?) -> Void) {
        let url = TreehouseURLContainer.url(key: .baseUrl)
        guard let urlRequest = TreehouseNetworkURLRequest(user?.accessToken,
                                                          url: url,
                                                          method: .get,
                                                          path: .feed(treeId: treeId)) else {
            completion(nil, TRHNetworkError.wrongURLRequestError)
            return
        }
        
        response(urlRequest,
                 type: FeedData.self,
                 completion: completion)
    }
}
