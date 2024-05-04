//
//  FeatureFlagClientApp.swift
//  FeatureFlagClient
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import SwiftUI

@main
struct BaklavaApp: App {
	var body: some Scene {
		MenuBarExtra("YAY", systemImage: "circle") {
			MenuBarWindow()
		}
		.menuBarExtraStyle(.window)
	}
}
