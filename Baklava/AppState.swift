//
//  AppState.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 29.09.2024.
//
import Foundation
import SwiftUI
import BaklavaAuth

@Observable class AppState {
    
    var loginState: LoginState = .loggedOut
    
    init() {
        Task { await getLoginState() }
    }
    
    func getLoginState() async {
        if (await Auth.getAuthToken()) != nil {
            loginState = .loggedIn
        }
    }
    
}

enum LoginState {
    case loggedIn
    case loggedOut
}
