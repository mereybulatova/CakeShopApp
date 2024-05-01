//
//  DiscountDetailView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct DiscountDetailView: View {
    
    var discount: Discount
    
    var body: some View {
        VStack {
            DiscountCell(discount: discount)
        }
    }
}

#Preview {
    DiscountDetailView(discount: Discount(id: "1", image: "discount"))
}
