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
    
    var appState: AppState = Interactor.getAppState()

    func login(username: String, password: String) async {
        let user = try? await Auth.login(with: PasswordLoginCredentials(username: username, password: password))
        appState.user = user
    }
}
