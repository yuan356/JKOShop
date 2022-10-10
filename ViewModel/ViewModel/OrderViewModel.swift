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
    
    public var orderList: Observable<[OrderModel]> = Observable([])

    public func getOrderList() {
        orderList.value = OrderService.shared.orderList
    }
    
    public init () {}
}
