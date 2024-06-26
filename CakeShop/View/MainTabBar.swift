//
//  MainTabBar.swift
//  CakeShop
//
//  Created by Мерей Булатова on 30.04.2024.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    @State private var isLogin = false
    
    var body: some View {
        
        TabView {
            NavigationStack {
                CatalogView()
                    .navigationTitle("Каталог")
            }
            
            .tabItem {
                VStack {
                    Text("Каталог")
                    Image(systemName: "menucard.fill")
                }
            }
            
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Text("Корзина")
                        Image(systemName: "cart")
                    }
                }
            
            ProfileView( viewModel: ProfileViewModel(profile: MBUser(id: "", name: "", phone: 0, address: "")))
                .tabItem {
                    VStack {
                        Text("Профиль")
                        Image(systemName: "person")
                    }
                }
        }.accentColor(Color("primaryPink"))
    }
}

//#Preview {
//    MainTabBar(viewModel: MainTabBarViewModel(user: User))
//}
