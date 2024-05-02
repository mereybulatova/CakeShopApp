//
//  ProductDetailViewModel.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
   @Published var product: Product 
   @Published var sizes = ["500 гр", "1 кг", "2 кг"]
   @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }

    func getPrice(size: String) -> Int {
        switch size {
        case sizes[0]: return product.price
        case sizes[1]: return Int(Double(product.price) * 1.5)
        case sizes[2]: return product.price * 2
        default: return 0
        }
    }
}
