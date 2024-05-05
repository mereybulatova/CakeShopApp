//
//  OrderCell.swift
//  CakeShop
//
//  Created by Мерей Булатова on 05.05.2024.
//

import SwiftUI

struct OrderCell: View {
    
    var order: Order 
    
    var body: some View {
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundColor(.green)
        }
    }
}
