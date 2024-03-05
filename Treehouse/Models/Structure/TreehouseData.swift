//
//  TreehouseData.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/23/24.
//

import Foundation

struct TreehouseData: Codable {
    let treehouseId: Int
    let treehouseName: String
    let memberCount: Int
    let topProfileImages: [String]
}
