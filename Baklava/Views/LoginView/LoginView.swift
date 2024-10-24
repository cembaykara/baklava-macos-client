//
//  LoginView.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 23.09.2024.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.appState) var appState: AppState
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            
            Text("Login")
                .font(.title3)
                .padding(.top)
            Divider()
                .padding(.bottom)
            
            Group {
                TextField("username", text: $username)
				SecureField("password", text: $password)
            }
            .padding(.horizontal)
            
            Button("Login") {
                Task {
                    await loginViewModel.login(
                        username: username,
                        password: password
                    )
                }
            }
            .padding(.top)
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Group {
                Text("Don't have an account?")
                Button { }
                label: {  Text("Sign Up")  }
                    .buttonStyle(.borderless)
                    .padding(.bottom)
            }
            .font(.caption)
        }
        .frame(width: 240, height: 320)
        .isBusy($loginViewModel.isBusy)
    }
}

#Preview {
    LoginView()
}
