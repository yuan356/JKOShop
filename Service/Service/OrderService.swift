//
//  OrderService.swift
//  Service
//
//  Created by Will Chen on 2022/10/10.
//

import Foundation
import Models

public class OrderService {
    
    static public let shared = OrderService()
    
    private var _orderList: [OrderModel]
    
    public var orderList: [OrderModel] {
        return _orderList
    }
    
    public init () {
        _orderList = []
    }
    
    private func addOrder(_ order: OrderModel) {
        _orderList.append(order)
    }
    
    public func createOrder(items: [CartItemModel]) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = formatter.string(from: currentDateTime)
        let amount = Double(items.reduce(0, { $0 + $1.totalAmount }))

        let order = OrderModel(items: items, createdTime: date, orderAmount: amount)
        addOrder(order)
        CartService.shared.clean(closedItems: items)
    }
}
