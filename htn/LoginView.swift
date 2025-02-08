//
//  LoginView.swift
//  htn
//
//  Created by Akshayan on 2024-09-14.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var user1 = ""
    @State private var pass1 = ""
    @State private var existingUser = false
    var body: some View {
        NavigationView {
            VStack {
                Image("download (1)")
                    .resizable()
                    .scaledToFit()
                    .frame(width:250, height:250)
                    .offset(x:0,y:-70)
                TextField("Username", text: $user1)
                    .padding(.leading)
                    .frame(width: 340, height: 50, alignment: .leading)
                    .border(.green)
                    .cornerRadius(5.0)
                    .padding(.leading)
                SecureField("Password", text: $pass1)
                    .padding(.leading)
                    .frame(width: 340, height: 50, alignment: .leading)
                    .border(.green)
                    .cornerRadius(5.0)
                    .padding(.leading)
               
                Button(action: {
                    signin()
                    existingUser.toggle()
                    
                    
                }, label: {
                    Text("Login")
                })
                .padding(.top)

            }
            
        }
        .fullScreenCover(isPresented: $existingUser) {
            ListUIView()
        }
        .navigationTitle("Welcome Back! ")
        
        
        
            
        
    }
    func signin() {
        Auth.auth().signIn(withEmail: user1, password: pass1) { authResult, error in
            if let error = error {
                print(error)
            }
            if let authResult = authResult {
                print(authResult.user.uid)
                
                
            }
          
        }
    }
}

#Preview {
    LoginView()
}
