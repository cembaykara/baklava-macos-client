//
//  LoginViewModel.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 23.09.2024.
//

import SwiftUI
import BaklavaCore
import BaklavaAuth
import Combine

@Observable class LoginViewModel {
    
    var appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }

    func login(username: String, password: String) async {
        let _ = try? await Auth.login(with: PasswordLoginCredentials(username: username, password: password))
        
        await appState.getLoginState()
    }
}
