//
//  ItemService.swift
//  Service
//
//  Created by Will Chen on 2022/10/9.
//

import Foundation
import Models

public class ItemService {
    public init() {}
    
    public func getItems() -> [ItemModel] {
        let file = "ItemsData"
        let bundle = Bundle(for: type(of: self))
        if let url = bundle.url(forResource: file, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DataModel.self, from: data)
                    return jsonData.data
                } catch {
                    print("error:\(error)")
                }
        }
        
        return []
    }
}
