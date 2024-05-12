//
//  LaunchScreen.swift
//  CakeShop
//
//  Created by Мерей Булатова on 08.05.2024.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            if let user = AuthService.shared.currentUser {
                if user.uid == "tLgcAvFIn3ZM0iWe7HRblWOojUI2" {
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel)
                }
            } else {
                AuthView()
            }
        } else {
            VStack {
                VStack {
                    Image("logo")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.primaryPink)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.1
                        self.opacity = 1.0
                    }
                }
            }
            .background(.primaryPink)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
