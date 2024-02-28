//
//  FeedData.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

struct FeedData: Codable {
    let posts: [PostData]
}

struct PostData: Codable {
    let postId: Int
    let authorId: Int
    let profileImageUrl: String
    let memberName: String
    // let branchDegree: Int
    let content: String
    let postImageUrls: [String]
    let createdAt: String
    let commentCount: Int
    let reactions: [ReactionData]
}
