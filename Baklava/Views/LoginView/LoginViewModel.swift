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
	var errorText: String?

    func login(username: String, password: String) async {
        isBusy = true
		
		do {
			let user = try await Auth.login(with: PasswordCredentials(username: username, password: password))
			appState.user = user
		} catch { errorText = error.localizedDescription }
		
        isBusy = false
    }
}
