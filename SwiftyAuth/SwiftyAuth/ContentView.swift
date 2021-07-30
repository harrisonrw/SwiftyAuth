//
//  ContentView.swift
//  SwiftyAuth
//
//  Created by Robert Harrison on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Theme.Color.primaryBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("swift-logo-white")
                
                Text("Welcome to Swifty Auth!")
                    .font(.system(size: 24.0, weight: .medium))
                    .foregroundColor(Theme.Color.primaryText)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button {
                    print("Login")
                } label: {
                    Text("Sign In")
                        .font(.system(size: 18.0, weight: .semibold))
                        .foregroundColor(Theme.Color.primaryText)
                }

            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
