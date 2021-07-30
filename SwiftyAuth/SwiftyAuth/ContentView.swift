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
            
            Color(red: 240.0/255.0, green: 81.0/255.0, blue: 56.0/255.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("swift-logo-white")
                
                Text("Welcome to Swifty Auth!")
                    .font(.system(size: 24.0, weight: .medium))
                    .foregroundColor(Color(red: 254.0/255.0, green: 254.0/255.0, blue: 254.0/255.0))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
