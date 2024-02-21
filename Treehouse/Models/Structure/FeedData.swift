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
    let profileImageUrl: String
    let memberName: String
    let branchDegree: Int
    let createdAt: Date
    let content: String
    let postImageUrls: [String]
    let reactions: [ReactionData]
    let commentCount: Int
}
