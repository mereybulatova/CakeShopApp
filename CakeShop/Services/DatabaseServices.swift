//
//  DataBaseServices.swift
//  CakeShop
//
//  Created by Мерей Булатова on 03.05.2024.
//

import Foundation
import FirebaseFirestore

class DatabaseServices {
    
    static let shared = DatabaseServices()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setupUser(user: MBUser, completion: @escaping (Result<MBUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
