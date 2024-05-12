//
//  DiscountCell.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct DiscountCell: View {
    
    var discount: Discount
    
    var body: some View {
        VStack {
            Image("discount")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
        }.cornerRadius(12)
            .frame(width: screen.width * 0.9, height: screen.width * 0.5)
            .aspectRatio(contentMode: .fill)
    }
}

#Preview {
    DiscountCell(discount: Discount(id: "1", image: "discount", title: "", description: "Тут тто"))
}
