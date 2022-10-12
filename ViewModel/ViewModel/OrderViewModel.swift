//
//  OrderViewModel.swift
//  ViewModel
//
//  Created by Will Chen on 2022/10/10.
//

import Foundation
import Models
import Service

public class OrderViewModel {
    func reorderObjects(_ items: [AnyObject]) -> [AnyObject] {
        return items.reversed()
    }
    
    public var orderList: Observable<[OrderModel]> = Observable([])

    public func getOrderList() {
        orderList.value = OrderService.shared.orderList.reorderObjects()
    }
    
    public init () {}

}
