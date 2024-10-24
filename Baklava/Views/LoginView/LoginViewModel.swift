//
//  LoginViewModel.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 23.09.2024.
//

import SwiftUI
import BaklavaCore
import BaklavaAuth

@Observable class LoginViewModel {
    
    var appState: AppState = Interactor.getAppState()
    
    var isBusy: Bool = false

    func login(username: String, password: String) async {
        isBusy = true
		let user = try? await Auth.login(with: PasswordCredentails(username: username, password: password))
        appState.user = user
        isBusy = false
    }
}
