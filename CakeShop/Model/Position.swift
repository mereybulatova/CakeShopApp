//
//  Position.swift
//  CakeShop
//
//  Created by Мерей Булатова on 02.05.2024.
//

import Foundation
import FirebaseFirestore

struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
    
    var represintation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = product.price
        repres["category"] = product.category
        repres["cost"] = self.cost
        return repres
    }
    
    internal init(id: String, product: Product, count: Int) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    init?(doc: QueryDocumentSnapshot) {
        
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let categoryString = data["category"] as? String else { return nil }
        guard let category = productCategory(rawValue: categoryString) else { return nil }
        let product: Product = Product(id: "",
                                       title: title,
                                       imageURL: "",
                                       price: price,
                                       description: "",
                                       category: category)
        guard let count = data["count"] as? Int else { return nil }
        
        self.id = id
        self.product = product
        self.count = count
    }
}
