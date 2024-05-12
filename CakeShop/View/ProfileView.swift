//
//  ProfileView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 01.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(spacing: 16) {
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .background(.primaryPink)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }.confirmationDialog("Откуда взять фото?", isPresented: $isAvaAlertPresented) {
                        Button(action: {
                            print("Phorotot")
                        }, label: {
                            Text("Из галереи")
                        })
                        
                        Button(action: {
                            print("Камера")
                        }, label: {
                            Text("С камеры")
                        })
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    
                    HStack {
                        Text("+7")
                        TextField("Введите номер телефона", value: $viewModel.profile.phone, format: .number)
                    }
                }
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Адрес доставки:")
                    .bold()
                TextField("Address", text: $viewModel.profile.address)
            }.padding(.horizontal)
           
            List {
                if viewModel.orders.count == 0 {
                    Text("Ваши заказы будут тут")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.red, lineWidth: 5)
                    )
                    .foregroundStyle(.red)
                    .fontWeight(.bold)
                    .cornerRadius(25)
            }.padding()
                .confirmationDialog("Точно ли выйти?", isPresented: $isQuitAlertPresented) {
                    Button(action: {
                        isAuthViewPresented.toggle()
                        AuthService.shared.signOut()
                    }, label: {
                        Text("Да")
                    })
                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil, content: {
                    AuthView()
                })
        }
        .onSubmit {
            self.viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(profile: MBUser(id: "", name: "Merey Bulatova", phone: 87071200528, address: "Хрен доедешь")))
}
