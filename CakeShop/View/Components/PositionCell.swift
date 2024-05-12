//
//  PositionCell.swift
//  CakeShop
//
//  Created by Мерей Булатова on 02.05.2024.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт")
            Text("\(position.cost) tg")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

#Preview {
    PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString,
                                                                            title: "Moloch",
                                                                            imageURL: "placeholder",
                                                                            price: 5999,
                                                                            description: "Vkusnooooo", category: productCategory.berryChoco), count: 1))
}
