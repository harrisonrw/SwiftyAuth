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
            
            Image("swift-logo-white")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
