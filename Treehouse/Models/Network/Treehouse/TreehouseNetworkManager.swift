//
//  TreehouseNetworkManager.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation
import Alamofire
import RxSwift

final class TreehouseNetworkManager: TRHNetworkManager {
    static let shared: TreehouseNetworkManager = TreehouseNetworkManager()
    private init() { 
        
        self.user = User(userId: 1, accessToken: "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNZW1iZXIxIiwiZXhwIjoxNzA5ODIzNTY3LCJpYXQiOjE3MDg2MTM5Njd9.0YcirKzIdfyEIhlgVkw9spcnQgHj0ldBAnWiGUWj3-Y", refreshToken: "")
    }
    
    @UserDefaultWrapper(key: .member, defaultValue: nil)
    var user: User?
}

extension TreehouseNetworkManager {
    func fetchFeed(treeId: Int,
                   completion: @escaping (_ value: [PostData]?, _ error: Error?) -> Void) {
        let url = TreehouseURLContainer.url(key: .baseUrl)
        guard let urlRequest = TreehouseNetworkURLRequest(user?.accessToken,
                                                          url: url,
                                                          method: .get,
                                                          path: .feed(treeId: treeId)) else {
            completion(nil, TRHNetworkError.wrongURLRequestError)
            return
        }
        
        response(urlRequest,
                 type: [PostData].self,
                 completion: completion)
    }
    
    func fetchPost(treeId: Int,
                   postId: Int,
                   completion: @escaping (_ value: PostDetailData?, _ error: Error?) -> Void) {
        let url = TreehouseURLContainer.url(key: .baseUrl)
        guard let urlRequest = TreehouseNetworkURLRequest(user?.accessToken,
                                                          url: url,
                                                          method: .get,
                                                          path: .posts(treeId: treeId, postId: postId)) else {
            completion(nil, TRHNetworkError.wrongURLRequestError)
            return
        }
    }
        
    func fetchComment(treeId: Int,
                      postId: Int,
                      completion: @escaping (_ value: CommentData?, _ error: Error?) -> Void) {
        let url = TreehouseURLContainer.url(key: .baseUrl)
        guard let urlRequest = TreehouseNetworkURLRequest(user?.accessToken,
                                                          url: url,
                                                          method: .get,
                                                          path: .comments(treeId: treeId, postId: postId)) else {
            completion(nil, TRHNetworkError.wrongURLRequestError)
            return
        }
    }
    
    func fetchNotification(completion: @escaping (_ value: [NotificationData]?, _ error: Error?) -> Void) {
        let url = TreehouseURLContainer.url(key: .baseUrl)
        guard let urlRequest = TreehouseNetworkURLRequest(user?.accessToken,
                                                          url: url,
                                                          method: .get,
                                                          path: .notifications) else {
            completion(nil, TRHNetworkError.wrongURLRequestError)
            return
        }
    }
        
//    func writePost(treeId: Int,
//                   content: String,
//                   postImageUrls: [String],
//                   completion: @escaping (_ value: , _ error: Error?) -> Void) {
//        let url = TreehouseURLContainer.url(key: .baseUrl)
//        guard let urlRequest = TreehouseNetworkURLRequest(user?.accessToken,
//                                                          url: url,
//                                                          method: .post,
//                                                          path: .writePost(treeId: treeId)) else {
//            completion(nil, TRHNetworkError.wrongURLRequestError)
//            return
//        }
//    }
}
