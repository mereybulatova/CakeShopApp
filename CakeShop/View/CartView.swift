//
//  CartView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.positions) { position in
                    PositionCell(position: position)
                        .swipeActions {
                            Button {
                                viewModel.positions.removeAll { pos in
                                    pos.id == position.id
                                }
                            } label: {
                                Text("Удалить")
                            }.tint(.red)

                        }
                }
                .listStyle(.plain)
                .navigationTitle("Корзина")
                
                HStack {
                    Text("Итого:")
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(self.viewModel.cost)")
                        .fontWeight(.bold)
                }.padding()
                
                VStack(spacing: 12) {
                    Button(action: {
                        print("Заказать")
                        
                        var order = Order(userID: AuthService.shared.currentUser!.uid,
                                          date: Date(),
                                          status: OrderStatus.new.rawValue)
                        
                        order.positions = self.viewModel.positions
                        
                        DatabaseService.shared.setOrder(order: order) { result in
                            switch result {
                                
                            case .success(let order):
                                print(order.cost)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }, label: {
                        Text("Заказать")
                            .frame(maxWidth: .infinity)
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color("primaryPink"))
                            .cornerRadius(25)
                    })
                    
                    Button(action: {
                        print("Отменить")
                    }, label: {
                        Text("Отменить")
                            .frame(maxWidth: .infinity)
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.primaryPink, lineWidth: 2)
                            )
                            .foregroundStyle(Color("primaryPink"))
                            .frame(maxWidth: .infinity)
                    })
                }.padding()
            }
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel.shared)
}
