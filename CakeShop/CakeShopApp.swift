//
//  CakeShopApp.swift
//  CakeShop
//
//  Created by Мерей Булатова on 30.04.2024.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct CakeShopApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
          
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            print("I love cakes")
            return true
        }
    }
}
