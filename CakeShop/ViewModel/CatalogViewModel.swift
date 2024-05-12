//
//  CatalogViewModel.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    @Published var products = [
        Product(id: "2",
                title: "Molochnaya",
                imageURL: "",
                price: 6590,
                description: "", 
                category: productCategory.desserts)]
    
    @Published var discount = [
        Discount(id: "1", 
                 image: "discount", 
                 title: "",
                 description: "nsdkjnksdjnvdkjvndkjvndkfjvnfkjvnsdvkjdfnvjkfdvnfkjvndfkjvnfkdj")
    ]
    
    func getProducts() {
        DatabaseService.shared.getProducts { result in
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

enum productCategory: String, CaseIterable {
    case popular = "Популярное"
    case kidsCake = "Детские торты"
    case forParents = "Для родителей"
    case mousseCakes = "Муссовые торты"
    case desserts = "Десерты"
    case berryChoco = "Клубника в шоколаде"
}
