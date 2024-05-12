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
        VStack(alignment: .leading, spacing: 12) {
            Image("discount")
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 240, maxHeight: 280)
                .aspectRatio(contentMode: .fit)
            
            Text("\(discount.title)")
                .padding(.horizontal, 2) 
                .frame(alignment: .leading)
                .padding(.horizontal)
                .font(.title.bold())
                
        }.ignoresSafeArea()
        
        Spacer()
    }
}

#Preview {
    DiscountDetailView(discount: Discount(id: "1", image: "discount", title: "Покупайте после 18:00 получайте скидку 50%", description: "Тут будет описание"))
}
