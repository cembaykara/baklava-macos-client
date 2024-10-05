//
//  Interactor.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 05.10.2024.
//

class Interactor {
    
    private var appState = AppState()
    private static var shared = Interactor()
    
    static func getAppState() -> AppState {
        return shared.appState
    }
    
}
