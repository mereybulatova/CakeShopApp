//
//  CatalogView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    @State private var searchText = ""
    @StateObject var viewModel = CatalogViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: layout, spacing: 12, content: {
                    ForEach(viewModel.discount, id: \.id) { item in
                        NavigationLink {
                                DiscountDetailView(discount: item)
                        } label: {
                            DiscountCell(discount: item)
                        }
                    }
                }).padding(.leading, 12)
                
            }
            
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 16, content: {
                        ForEach(viewModel.filter, id: \.id) { item in
                            NavigationLink {
//                                ProductDetailView(product: item)
                            } label: {
                                ProductFilterCell(filter: item)
                                    .foregroundStyle(.black)
                            }
                        }
                    }).padding()
                    
                }
            
            Text("Хиты продаж")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundStyle(.black)
                            }
                        }
                    }).padding()

            }.frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle.bold())
        }.background(.white)
            .onAppear {
                viewModel.getProducts()
            }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(width: 40, height: 36)
            
            TextField("Я ищу...", text: $text)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .background(Color("elementsBackground"))
                .cornerRadius(8)
                .fontWeight(.bold)
        }.background(Color("elementsBackground"))
            .cornerRadius(12)
    }
}

#Preview {
    CatalogView()
}
