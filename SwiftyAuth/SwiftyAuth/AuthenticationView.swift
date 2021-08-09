//
//  AuthenticationView.swift
//  AuthenticationView
//
//  Created by Robert Harrison on 7/30/21.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var isRegisterPresented = false
    
    var body: some View {
        
        ZStack {
            
            Theme.Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("swift-logo-orange")
                    .padding()
                
                if isRegisterPresented {
                    
                    TextField("First Name", text: $firstName)
                        .frame(height: 54)
                        .textFieldStyle(.plain)
                        .textContentType(.givenName)
                        .padding(.horizontal, 10)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    
                    TextField("Last Name", text: $lastName)
                        .frame(height: 54)
                        .textFieldStyle(.plain)
                        .textContentType(.familyName)
                        .padding(.horizontal, 10)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    
                }
                
                TextField("Email", text: $email)
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
                    
                    if isRegisterPresented {
                        // Register
                    } else {
                        // Sign In
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    let actionButtonTitle = isRegisterPresented ? "Register" : "Sign In"
                    Text(actionButtonTitle)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Theme.Color.buttonText)
                        .background(Theme.Color.buttonBackground)
                        .cornerRadius(Theme.cornerRadius)
                        .font(.system(size: 18.0, weight: .semibold))
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 4)
                }
                
                if !isRegisterPresented {
                    Button("Reset Password") {
                        print("Reset Password")
                    }
                    .foregroundColor(Theme.Color.buttonTextAlt)
                    .padding(.top, 20)
                }
                

                let modeButtonTitle = isRegisterPresented ? "Already have an account? Sign in" : "Create a new account"
                Button(modeButtonTitle) {
                    isRegisterPresented.toggle()
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
