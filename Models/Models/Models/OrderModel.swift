//
//  OrderModel.swift
//  JKOShop_Will Chen
//
//  Created by Will Chen on 2022/10/8.
//

import Foundation

public struct OrderModel: Decodable {
    public let items: [ItemModel]
    public let createdTime: String
    public let orderAmount: Double
}
