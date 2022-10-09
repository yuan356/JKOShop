//
//  ItemModel.swift
//  Models
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation

public struct ItemModel: Decodable {
    public let title: String
    public let desc: String
    public let amount: Double
    let createdTime: String
    public let imageUrl: String
}
