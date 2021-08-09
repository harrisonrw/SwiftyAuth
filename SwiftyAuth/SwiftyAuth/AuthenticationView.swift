//
//  AuthenticationView.swift
//  AuthenticationView
//
//  Created by Robert Harrison on 7/30/21.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        ZStack {
            
            Theme.Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("swift-logo-orange")
                    .padding()
                
                TextField("Username", text: $username)
                    .frame(height: 54)
                    .textFieldStyle(.plain)
                    .textContentType(.username)
                    .padding(.horizontal, 10)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                
                
                SecureField("Password", text: $password)
                    .frame(height: 54)
                    .textFieldStyle(.plain)
                    .textContentType(.password)
                    .padding(.horizontal, 10)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Sign In")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Theme.Color.buttonText)
                        .background(Theme.Color.buttonBackground)
                        .cornerRadius(Theme.cornerRadius)
                        .font(.system(size: 18.0, weight: .semibold))
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 4)
                }
                
                
                Button("Reset Password") {
                    print("Reset Password")
                }
                .foregroundColor(Theme.Color.buttonTextAlt)
                .padding(.top, 20)
                

                Button("Create a new account") {
                    print("Register")
                }
                .foregroundColor(Theme.Color.buttonTextAlt)
                .padding(.top, 20)
                
                Spacer()
                
            }
            
        }
        
        
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
