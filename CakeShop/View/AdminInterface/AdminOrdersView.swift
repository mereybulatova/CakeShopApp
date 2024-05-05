//
//  AdminOrdersView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 05.05.2024.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false
    @State var isShowAddProductView = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                }, label: {
                    Text("Выход")
                        .foregroundStyle(.red)
                        .bold()
                })
                
                Spacer()
                
                Button(action: {
                    isShowAddProductView.toggle()
                }, label: {
                    Text("Добавить товар")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .background(.primaryPink)
                        .cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: {
                    viewModel.getOrders()
                }, label: {
                    Text("Обновить")
                        .bold()
                })
            }.padding()
            
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }.listStyle(.plain)
                .onAppear {
                    viewModel.getOrders()
                }
                .sheet(isPresented: $isOrderViewShow, content: {
                    let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                    OrderView(viewModel: orderViewModel)
            })
        }.fullScreenCover(isPresented: $isShowAuthView, content: {
            AuthView()
        })
        .sheet(isPresented: $isShowAddProductView, content: {
            AddProductView()
        })
    }
}

#Preview {
    AdminOrdersView()
}
