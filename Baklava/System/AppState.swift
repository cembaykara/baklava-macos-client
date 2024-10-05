//
//  AppState.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 29.09.2024.
//
import Foundation
import SwiftUI
import BaklavaAuth
import BaklavaCore

@Observable class AppState {
    
    var loginState: LoginState {
        get { user != nil ? .loggedIn : .loggedOut }
    }
    
    var user: User?
}

enum LoginState {
    case loggedIn
    case loggedOut
}
