//
//  FeatureFlagItem.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import SwiftUI

struct FeatureFlagItem: View {
	
	@Bindable var flag: Flag

	let onDisable: () -> Void
	
    var body: some View {
		HStack {
			Text(flag.name)
				.minimumScaleFactor(0.5)
				.lineLimit(1)
			Spacer()
			Toggle("", isOn: $flag.enabled)
				.toggleStyle(.switch)
				.onChange(of: flag.enabled) { onDisable() }
		}
    }
}

#Preview {
	FeatureFlagItem(flag: Flag(id: UUID(), name: "My Flag", enabled: true), onDisable: {})
}
