//
//  Item.swift
//  Operation-1
//
//  Created by ChandlerZou on 2018/10/8.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import Foundation
class Item{
    let count: Int
    
    init(number: Int) {
        self.count = number
    }
    
    static func createItems(count: Int) -> [Item]{
        var items = [Item]()
        for index in 1...count{
            items.append(Item(number: index))
        }
        
        return items
    }
    
    func imageUrl() -> URL?{
        return URL(string: "https://placebeard.it/355/140")
    }
}
