//
//  TreehouseData.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/23/24.
//

import Foundation

struct TreehouseData: Codable {
    let treeName: String
    let treeSize: Int
    let treeMemberProfileImages: [String]
    let isSelected: Bool
}
