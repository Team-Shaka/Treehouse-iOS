//
//  PostDetailData.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

struct PostDetailData: Codable {
    let postId: Int
    let authorId: Int
    let profileImageUrl: String
    let memberName: String
    let branchDegree: Int
    let content: String
    let postImageUrls: [String]
    let reactions: [ReactionData]
    let createdAt: String
}
