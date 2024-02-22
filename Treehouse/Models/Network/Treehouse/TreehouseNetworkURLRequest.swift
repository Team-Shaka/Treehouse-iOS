//
//  TreehouseNetworkURLRequest.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation
import Alamofire

public struct TreehouseNetworkURLRequest: TRHURLRequest {
    var accessToken: String?
    var urlRequest: URLRequest
    var httpMethod: TRHHTTPMethod
    var path: Path
    var httpBody: Data?
    var query: [String: String]?
    var timeoutInterval: TimeInterval
    
    init(_accessToken: String?,
         _urlRequest: URLRequest,
         _method: TRHHTTPMethod,
         _path: Path,
         _httpBody: Data?,
         _query: [String : String]?,
         _timeoutInterval: TimeInterval) {
        self.accessToken = _accessToken
        self.urlRequest = _urlRequest
        self.httpMethod = _method
        self.path = _path
        self.httpBody = _httpBody
        self.query = _query
        self.timeoutInterval = _timeoutInterval
    }
}

extension TreehouseNetworkURLRequest {
    enum Path: TRHPath {
        case root
        case feed(treeId: Int)
        case posts(treeId: Int, postId: Int)
        case writePost(treeId: Int)
        case comments(treeId: Int, postId: Int)
        case editComment(treeId: Int, postId: Int, commentId: Int)
        
        var path: String {
            switch self {
            case .root: return ""
            case let .feed(treeId): return "trees/\(treeId)/feed"
            case let .posts(treeId, postId): return "trees/\(treeId)/feed/posts/\(postId)"
            case let .writePost(treeId): return "trees/\(treeId)/feed/posts"
            case let .comments(treeId, postId): return "trees/\(treeId)/feed/posts/\(postId)/comments"
            case let .editComment(treeId, postId, commentId): return "trees/\(treeId)/feed/posts/\(postId)/comments/\(commentId)"
            }
        }
        
        var available: [TRHHTTPMethod] {
            switch self {
            case .root: return [.get]
            case .feed: return [.get]
            case .posts: return [.get]
            case .writePost: return [.post]
            case .comments: return [.get, .post]
            case .editComment: return [.patch, .delete]
            }
        }
    }
    
    enum QueryKey: String, TRHQueryKey {
        case date
    }
    
    enum HTTPBodyKey: String, TRHHTTPBodyKey {
        case memberId
        case treeId
        case postId
        case commentId
    }
}
