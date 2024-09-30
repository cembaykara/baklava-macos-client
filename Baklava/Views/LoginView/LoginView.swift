//
//  LoginView.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 23.09.2024.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.appState) var appState: AppState
    
    @State var title: String = "Login"
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginViewModel: LoginViewModel
    
    init(appState: AppState) {
        self.loginViewModel = .init(appState: appState)
    }
    
    var body: some View {
        VStack {
            
            Text(title)
                .bold()
            
            Divider()
            
            Group {
                TextField("username", text: $username)
                TextField("password", text: $password)
            }
            .padding(.horizontal)
            
            Button("Login") {
                Task {
                    await loginViewModel.login(username: username, password: password)
                }
            }
            .padding(.top)
            .buttonStyle(.borderedProminent)
            
            Group {
                Text("Don't have an account?")
                    .padding(.top)
                Button { }
                label: {  Text("Sign Up")  }
                    .buttonStyle(.borderless)
            }
            .font(.caption)
            
            
            Spacer()
        }
        .padding(.top)
        .frame(width: 240)
    }
}

#Preview {
    var appState: AppState = .init()
    LoginView(appState: AppState())
}
