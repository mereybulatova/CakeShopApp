//
//  Product.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import Foundation
import FirebaseFirestore

struct Product {
    var id: String
    var title: String
    var imageURL: String = ""
    var price: Int
    var description: String
    var category: productCategory
//    var ordersCount: Int
//    var isRecommend: Bool
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["description"] = self.description
        repres["category"] = self.category.rawValue
        return repres
    }
    
    internal init(id: String = UUID().uuidString,
                  title: String,
                  imageURL: String = "",
                  price: Int,
                  description: String,
                  category: productCategory) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.price = price
        self.description = description
        self.category = category
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let description = data["description"] as? String else { return nil }
        guard let categoryString = data["category"] as? String else { return nil }
        
        guard let category = productCategory(rawValue: categoryString) else { return nil }
        
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
    }
}
