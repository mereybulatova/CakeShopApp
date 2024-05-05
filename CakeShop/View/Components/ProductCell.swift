//
//  ProductCell.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "placeholder")
    var body: some View {
       
        VStack(spacing: 2) {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
            
            HStack {
                Text(product.title)
                    .font(.caption.bold())
                Spacer()
                Text("\(product.price) тг/кг")
                    .font(.caption.bold().italic())
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .background(Color("elementsBackground"))
            .cornerRadius(12)
            .onAppear {
                StorageService.shared.downloadProductImage(id: self.product.id) { result in
                    switch result {
                    case .success(let data):
                        if let img = UIImage(data: data) {
                            self.uiImage = img
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

#Preview {
    ProductCell(product: Product(id: "1", title: "Вупи пай", imageURL: "", price: 7500, description: "Ijrk"))
}
