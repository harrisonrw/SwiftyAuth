//
//  UserManager.swift
//  UserManager
//
//  Created by Robert Harrison on 8/9/21.
//

import Foundation

@MainActor
final class UserManager: ObservableObject {
    static let shared = UserManager()
    
    @Published var currentUser: User?
    
    var isSignedIn: Bool {
        return currentUser != nil
    }
    
    func signIn(email: String, password: String) async throws -> User {
        
        // This is where we would call a web API to validate the user.
        
        currentUser = User(
            id: "1234",
            email: email,
            firstName: "John",
            lastName: "Smith"
        )
        
        return currentUser!
        
    }
    
    func register(firstName: String, lastName: String, email: String, password: String) async throws -> User {
        
        // This is where we would call a web API to register the user.
        
        currentUser = User(
            id: "1234",
            email: email,
            firstName: "John",
            lastName: "Smith"
        )
        
        return currentUser!
    }
    
    func signOut() {
        currentUser = nil
    }
    
    
    
}
