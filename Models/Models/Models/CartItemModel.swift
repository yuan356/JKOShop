//
//  CartModel.swift
//  Models
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation

public struct CartItemModel {
    public var item: ItemModel
    public var count: Int
    
    public init (item: ItemModel) {
        self.item = item
        count = 1
    }
}
