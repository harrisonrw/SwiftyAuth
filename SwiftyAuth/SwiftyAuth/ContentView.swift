//
//  ContentView.swift
//  SwiftyAuth
//
//  Created by Robert Harrison on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAuthenticationViewPresented = false
    
    @StateObject private var userManager = UserManager.shared
    
    var body: some View {
        
        ZStack {
            
            Theme.Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("swift-logo-orange")
                    .padding()
                
                Text("Welcome to Swifty Auth!")
                    .font(.system(size: 24.0, weight: .medium))
                    .foregroundColor(Theme.Color.text)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                if userManager.isSignedIn {
                    Text("You are signed in!")
                        .font(.system(size: 20.0, weight: .regular))
                        .foregroundColor(Theme.Color.text)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                }
                
                Button {
                    
                    if userManager.isSignedIn {
                        userManager.signOut()
                    } else {
                        isAuthenticationViewPresented.toggle()
                    }
                    
                } label: {
                    
                    let buttonTitle = userManager.isSignedIn ? "Sign Out" : "Sign In"
                    Text(buttonTitle)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Theme.Color.buttonText)
                        .background(Theme.Color.buttonBackground)
                        .cornerRadius(Theme.cornerRadius)
                        .font(.system(size: 18.0, weight: .semibold))
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                }
                .fullScreenCover(isPresented: $isAuthenticationViewPresented, onDismiss: nil, content: AuthenticationView.init)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
