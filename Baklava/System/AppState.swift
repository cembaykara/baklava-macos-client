//
//  AppState.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 29.09.2024.
//
import Foundation
import SwiftUI
import BaklavaAuth
@_spi(BKLInternal) import BaklavaCore // TODO: Will Remove
import BaklavaAuth

@Observable class AppState {
    
    var loginState: LoginState {
        get { user != nil ? .loggedIn : .loggedOut }
    }
    
    var user: User?
	
	init() {
		Task {
			let tokenString = await Auth.getAuthToken()
			user = try? User(tokenString ?? "")
		}
	}
	
	func signOut() {
		Auth.logout()
		self.user = nil
	}
}

enum LoginState {
    case loggedIn
    case loggedOut
}
