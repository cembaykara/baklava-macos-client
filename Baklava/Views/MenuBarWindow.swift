//
//  MenuBarWindow.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import SwiftUI

struct MenuBarWindow: View {
	
    @Environment(\.appState) var appState: AppState
	
	var body: some View {
		
        switch appState.loginState {
            case .loggedIn:
                FeaturesView()
            case .loggedOut:
                LoginView(appState: appState)
        }
        
	}
}

#Preview {
    MenuBarWindow()
}
