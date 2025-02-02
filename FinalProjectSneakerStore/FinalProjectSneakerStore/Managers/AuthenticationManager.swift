//
//  AuthenticationManager.swift
//  BookmarkWithFirebase
//
//  Created by Alihan on 27.01.2025.
//

import Foundation
import Firebase
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}


final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
        private init() { }

        
        func createUser(email: String, password: String, username: String) async throws {
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let userID = authDataResult.user.uid
            
            
            let db = Firestore.firestore()
            try await db.collection("users").document(userID).setData([
                "username": username,
                "email": email,
                "createdAt": Timestamp(date: Date())
            ])
            
            
            let changeRequest = authDataResult.user.createProfileChangeRequest()
            changeRequest.displayName = username
            try await changeRequest.commitChanges()
            
            print("User created with ID: \(userID) and username: \(username)")
        }
}
