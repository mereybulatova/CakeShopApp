//
//  MainTabBarViewModel.swift
//  CakeShop
//
//  Created by Мерей Булатова on 03.05.2024.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
