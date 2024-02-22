//
//  Array+.swift
//  Treehouse
//
//  Created by 이전희 on 2/23/24.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
