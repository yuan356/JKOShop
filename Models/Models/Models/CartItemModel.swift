//
//  CartModel.swift
//  Models
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation

protocol Calculable {
    var totalAmount: Int { get }
}

public struct CartItemModel: Calculable {
    
    public var item: ItemModel
    public var count: Int
    public var totalAmount: Int {
        return Int(item.amount) * count
    }
    
    public init (item: ItemModel) {
        self.item = item
        count = 1
    }
}
