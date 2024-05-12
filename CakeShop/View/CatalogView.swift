//
//  CatalogView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    @State private var selectedCategoryIndex = 0
    @State private var isShowingDetail = false
    @StateObject var viewModel = CatalogViewModel()
    @State private var selectedCategory: productCategory = .popular
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(self.viewModel.discount, id: \.id) { item in
                    DiscountCell(discount: item)
                        .onTapGesture {
                            isShowingDetail = true
                        }
                }
                .sheet(isPresented: $isShowingDetail, content: {
                    DiscountDetailView(discount: Discount(id: "", image: "", title: "Покупайте после 18:00 получайте скидку 50%", description: ""))
                })
            }.padding(.horizontal, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: layout, spacing: 16, content: {
                    ForEach(productCategory.allCases, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category.rawValue)
                                .foregroundColor(category == selectedCategory ? .primaryPink : .black)
                                .bold()
                        }
                        .frame(maxHeight: .infinity)
                        .padding(12)
                        .background(.elementsBackground)
                        .cornerRadius(8)
                    }
                })
            }.padding(.horizontal, 12)
            
            switch selectedCategory {
            case .popular:
                Text("Популярное")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            if item.category == .popular {
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }).padding()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            case .kidsCake:
                Text("Детские торты")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            if item.category == .kidsCake {
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }).padding()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            case .forParents:
                Text("Для родителей")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            if item.category == .forParents {
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }).padding()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            case .mousseCakes:
                Text("Муссовые торты")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            if item.category == .mousseCakes {
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }).padding()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            case .desserts:
                Text("Десерты")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            if item.category == .desserts {
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }).padding()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            case .berryChoco:
                Text("Клубника в шоколаде")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16, content: {
                        ForEach(viewModel.products, id: \.id) { item in
                            if item.category == .berryChoco {
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }).padding()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            }
        }.background(.white)
            .onAppear {
                viewModel.getProducts()
            }
    }
}

#Preview {
    CatalogView()
}
