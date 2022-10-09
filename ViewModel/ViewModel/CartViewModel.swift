//
//  CartViewModel.swift
//  ViewModel
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation
import Models
import Service

public class CartViewModel {
    
    public var cartItems: Observable<[CartItemModel]> = Observable([])
    
    public func addToCart(item: ItemModel) {
        CartService.shared.add(item: item)
    }
    
    public func getCartItems() {
        cartItems.value = CartService.shared.cartItems
    }
    
    public init () {}
    
}
