//
//  ContentView.swift
//  CakeShop
//
//  Created by Мерей Булатова on 30.04.2024.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Image("logo")
        }.padding(.top, 80)
            .frame(maxWidth: .infinity, maxHeight: 200)
            .ignoresSafeArea()
            .background(Color("primaryPink"))
        
        VStack {
            Text(isAuth ? "С возвращением!" : "Регистрация")
                .font(.title.bold())
                .padding(.horizontal)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(Color.black)
            
            Spacer().frame(height: 10)
            Text("Торты для любого повода")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(Color.gray)
            
            Spacer().frame(height: 24)
            VStack(spacing: 8) {
                Text("Email")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(width: 350, height: 15, alignment: .leading)
                    .foregroundStyle(Color.black)
                
                TextField("Введите Email", text: $email)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color("primaryPink"))
                    .background(Color("elementsBackground"))
                    .cornerRadius(15)
                
                Spacer().frame(height: 2)
                Text("Пароль")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(width: 350, height: 15, alignment: .leading)
                    .foregroundStyle(Color.black)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color("primaryPink"))
                    .background(Color("elementsBackground"))
                    .cornerRadius(15)
                
                if !isAuth {
                    Spacer().frame(height: 2)
                    Text("Повторите пароль")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(width: 350, height: 15, alignment: .leading)
                        .foregroundStyle(Color.black)
                    
                    SecureField("Повторите пароль", text: $confirmpassword)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color("primaryPink"))
                        .background(Color("elementsBackground"))
                        .cornerRadius(15)
                }
            }
            
            Spacer()
            
            VStack(spacing: 15) {
                Button {
                    if isAuth {
                        print("Авторизация")
                        AuthService.shared.signIn(email: email, password: password) { result in
                            switch result {
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \n\(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                    } else {
                        print("Регистрация")
                        
                        guard password == confirmpassword else {
                            self.alertMessage = "Пароли не совпадают!"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.registration(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(let user):
                                alertMessage = "Вы зарегистрировались с email \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmpassword = ""
                                self.isAuth.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \n\(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                    }
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("primaryPink"))
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .cornerRadius(25)
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Еще не с нами?" : "Войти в аккаунт")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 12)
                        .font(.subheadline)
                        .foregroundStyle(Color("primaryPink"))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .clipped()
        .alert(alertMessage, isPresented: $isShowAlert, actions: {
            Button(action: { }, label: {
                Text("OK")
            })
        })
        .animation(Animation.easeOut(duration: 0.5), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow, content: {
            if AuthService.shared.currentUser?.uid == "tLgcAvFIn3ZM0iWe7HRblWOojUI2" {
                AdminOrdersView()
            } else {
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                MainTabBar(viewModel: mainTabBarViewModel)
            }
        })
    }
}

#Preview {
    AuthView()
}
