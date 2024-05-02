//
//  ProductDetailView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "500 гр"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, content: {
                Image("placeholder")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 280)
                
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.title2.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: size))")
                        .font(.title2)
                }.padding(.horizontal)
                
                Text("\(viewModel.product.description)")
                    .padding(.horizontal)
                    .padding(.vertical, 2)
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...10)
                    
                    Text("\(self.count)")
                        .padding(.leading, 24)
                }.padding(.horizontal)
                
                Picker("Вес торта", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
              
            }).padding(.top, -50)
            
            Button(action: {
                var position = Position(id: UUID().uuidString, product: viewModel.product, count: self.count)
                position.product.price = viewModel.getPrice(size: size)
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Добавить в корзину")
                    .font(.title)
            })
            
            Spacer()
        }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "2",
                                                                         title: "Molochnaya",
                                                                         imageURL: "",
                                                                         price: 6590,
                                                                         description: "Dhbfjefnewkjefnekfnerkfnefjknerkjdnvdfjknvdivneirknvjdfkjvnfdkjv")))
}
