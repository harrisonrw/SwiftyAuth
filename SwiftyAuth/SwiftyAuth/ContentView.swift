//
//  ContentView.swift
//  SwiftyAuth
//
//  Created by Robert Harrison on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAuthenticationViewPresented = false
    
    var body: some View {
        
        ZStack {
            
            Theme.Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("swift-logo-orange")
                
                Text("Welcome to Swifty Auth!")
                    .font(.system(size: 24.0, weight: .medium))
                    .foregroundColor(Theme.Color.text)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button {
                    
                    isAuthenticationViewPresented.toggle()
                    
                } label: {
                    Text("Sign In")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Theme.Color.buttonText)
                        .background(Theme.Color.buttonBackground)
                        .cornerRadius(Theme.cornerRadius)
                        .font(.system(size: 18.0, weight: .semibold))
                        .padding(.horizontal, 20.0)
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
