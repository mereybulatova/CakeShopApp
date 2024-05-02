//
//  Position.swift
//  CakeShop
//
//  Created by Мерей Булатова on 02.05.2024.
//

import Foundation

struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
