//
//  AddProductView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 06.05.2024.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "placeholder")!
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: Int? = nil
    @State private var selectedCategoryIndex = 0
    
    var categories: [String] {
        productCategory.allCases.map { $0.rawValue }
    }
       
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Добавить товар")
                .font(.title2.bold())
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 280, maxHeight: 300)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .cornerRadius(24)
            
            Picker(selection: $selectedCategoryIndex) {
                ForEach(0..<categories.count, id: \.self) { index in
                    Text(categories[index])
                }
            } label: {
                Text("Категория продукта")
            }
            .alignmentGuide(.leading) { _ in 0 }
            .padding(.horizontal, 95)
            .frame(alignment: .leading)
            .frame(maxWidth: .infinity)
            .pickerStyle(.menu)
            
            TextField("Название продукта", text: $title)
                .padding()
            TextField("Цена продукта", value: $price, format: .number)
                .padding()
                .keyboardType(.numberPad)
            TextField("Описание продукта", text: $description)
                .padding()
            
            Button(action: {
                guard let price = price else {
                    print("Невозможно извлечь цену из TextField")
                    return
                }
                let selectedCategory = productCategory.allCases[selectedCategoryIndex]
                let product = Product(id: UUID().uuidString, title: title, imageURL: "", price: price, description: description, category: selectedCategory)
                guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                    case .success(let product):
                        print(product.title)
                        dismiss()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }, label: {
                Text("Сохранить")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.primaryPink)
                    .foregroundStyle(.white)
                    .bold()
                    .cornerRadius(16)
            }).padding()
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        })
    }
}

#Preview {
    AddProductView()
}
