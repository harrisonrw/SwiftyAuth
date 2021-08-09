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
    
    @State private var isAlertPresented = false
    @State private var alertMessage = "An unknown error has occured!"
    
    init() {
        // Transparent Navigation Bar
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Theme.Color.background
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical) {
                    
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
                            .textContentType(.emailAddress)
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
                            
                            guard isInputValid() else { return }
                            
                            Task {
                                do {
                                    
                                    if isRegisterPresented {
                                        let _ = try await UserManager.shared.register(firstName: firstName, lastName: lastName, email: email, password: password)
                                    } else {
                                        let _ = try await UserManager.shared.signIn(email: email, password: password)
                                    }
                                    presentationMode.wrappedValue.dismiss()
                                    
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            
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
                .frame(maxWidth: .infinity)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Theme.Color.buttonTextAlt)
                    }

                }
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
        }
        
    }
    
    private func isInputValid() -> Bool {
        if isRegisterPresented && firstName.isEmpty {
            alertMessage = "Please enter your first name."
            isAlertPresented = true
            return false
        } else if isRegisterPresented && lastName.isEmpty {
            alertMessage = "Please enter your last name."
            isAlertPresented = true
            return false
        } else if email.isEmpty {
            alertMessage = "Please enter your email."
            isAlertPresented = true
            return false
        } else if password.isEmpty {
            alertMessage = "Please enter a password."
            isAlertPresented = true
            return false
        }
        
        return true
    }
    
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
