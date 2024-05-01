//
//  CatalogViewModel.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var products = [
        Product(id: "2",
                title: "Molochnaya",
                imageURL: "",
                price: 6590,
                description: ""),
        Product(id: "3",
                title: "Snickers",
                imageURL: "",
                price: 8000,
                description: ""),
        Product(id: "4",
                title: "Banan",
                imageURL: "",
                price: 8000,
                description: ""),
        Product(id: "5",
                title: "Klubnika",
                imageURL: "",
                price: 8000,
                description: "")]
    
    var filter = [
        Filter(title: "Детские торты",
               id: "1"),
        Filter(title: "Для родителей",
               id: "2"),
        Filter(title: "Муссовые торты",
               id: "3"),
        Filter(title: "Десерты",
               id: "4"),
        Filter(title: "Клубника в шоколаде",
               id: "5")]
    
    var discount = [
        Discount(id: "1", 
                 image: "discount"),
        Discount(id: "2", 
                 image: "discount")
    ]
}
