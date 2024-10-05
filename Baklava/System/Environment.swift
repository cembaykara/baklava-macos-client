//
//  Environment.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 30.09.2024.
//
import SwiftUI

private struct AppStateKey: EnvironmentKey {
    static let defaultValue: AppState = Interactor.getAppState()
}

extension EnvironmentValues {
    var appState: AppState {
        get { self[AppStateKey.self] }
    }
}
