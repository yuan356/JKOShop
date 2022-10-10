//
//  CartService.swift
//  Service
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation
import Models

public class CartService {
    
    static public var shared = CartService()
    
    private var _cartItems: [CartItemModel]
    
    public var cartItems: [CartItemModel] {
        return _cartItems
    }
    
    private init() {
        _cartItems = []
    }
    
    public func add(item: ItemModel) {
        if let index = cartItems.firstIndex(where: { $0.item.id == item.id }) {
            _cartItems[index].count += 1
        } else {
            let cartItem = CartItemModel(item: item)
            self._cartItems.append(cartItem)
        }
    }
    
    public func clean(closedItems: [CartItemModel]) {
        _cartItems.removeAll { (cartItem) -> Bool in
            closedItems.contains(where: { $0.item.id == cartItem.item.id })
        }
    }
}
