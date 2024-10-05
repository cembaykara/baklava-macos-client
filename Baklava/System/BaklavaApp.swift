//
//  FeatureFlagClientApp.swift
//  FeatureFlagClient
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import SwiftUI
import BaklavaCore

@main
struct BaklavaApp: App {
    
	init() {
		let config = BaklavaConfiguration(
            logVerbosity: .critical,
            host: "127.0.0.1",
            port: 8080)
        
		Baklava.setConfiguration(config)
	}
	
	var body: some Scene {
		MenuBarExtra("YAY", systemImage: "flag.circle") {
            MenuBarWindow()
		}
		.menuBarExtraStyle(.window)
	}
}
