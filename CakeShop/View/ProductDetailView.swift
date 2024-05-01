//
//  ProductDetailView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product 
    
    var body: some View {
        Text("\(product.title)")
    }
}

#Preview {
    ProductDetailView(product:  Product(id: "2",
                                        title: "Molochnaya",
                                        imageURL: "",
                                        price: 6590,
                                        description: ""))
}
