//
//  CommentData.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation

struct CommentData: Codable {
    let commentId: Int
    let content: String
    let reactions: [ReactionData]
    let createdAt: Date
    let replies: [ReplyData]
}

struct ReplyData: Codable {
    let replyId: Int
    let content: String
    let reactions: [ReactionData]
    let createdAt: Date
}
