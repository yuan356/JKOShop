//
//  itemViewModel.swift
//  Cart
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation
import Models
import Service

public class ItemViewModel {
    
    public init () {}
    
    public var items: Observable<[ItemModel]> = Observable([])
    
    public func getItems() {
        let items = ItemService().getItems()
        self.items.value = items
    }
    
}
