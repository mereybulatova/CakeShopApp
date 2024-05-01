//
//  ProductFilterCell.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct ProductFilterCell: View {
    
    var filter: Filter
    
    var body: some View {
        
        HStack {
            Text(filter.title)
                .font(.callout)
                .fontWeight(.bold)
        }.frame(width: screen.width * 0.4, height: screen.width * 0.1)
            .background(Color("elementsBackground"))
            .cornerRadius(12)
    }
}

#Preview {
    ProductFilterCell(filter: Filter(title: "Детские торты", id: "1"))
}
