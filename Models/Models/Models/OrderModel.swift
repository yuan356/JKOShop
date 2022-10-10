//
//  OrderModel.swift
//  JKOShop_Will Chen
//
//  Created by Will Chen on 2022/10/8.
//

import Foundation

public struct OrderModel {
    public let items: [CartItemModel]
    public let createdTime: String
    public let orderAmount: Double
    
    public init(items: [CartItemModel], createdTime: String, orderAmount: Double) {
        self.items = items
        self.createdTime = createdTime
        self.orderAmount = orderAmount
    }
}
