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
    @State var name: String = "Имя Фамилия"
    @State var phone: Int = 7071200528
    @State var address: String = "Ваш адрес будет тут"
    
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
                    TextField("Имя", text: $name)
                        .font(.body.bold())
                    
                    HStack {
                        Text("+7")
                        TextField("Phone", value: $phone, format: .number)
                    }
                }
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Адрес доставки:")
                    .bold()
                TextField("Address", text: $address)
            }.padding(.horizontal)
           
            List {
               Text("Ваши заказы будут тут")
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
                    }, label: {
                        Text("Да")
                    })
                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil, content: {
                    AuthView()
                })
        }
    }
}

#Preview {
    ProfileView()
}
