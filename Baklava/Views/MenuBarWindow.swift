//
//  MenuBarWindow.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import SwiftUI

struct MenuBarWindow: View {
	
	@Bindable var featureFlagViewModel = FeatureFlagsViewModel()
	@State private var temporaryText: String = ""
	
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Spacer()
				
				Text("Feature Flags")
					.bold()
				
				Spacer()
				
				Image(systemName: "arrow.clockwise")
					.imageScale(.large)
					.onTapGesture { featureFlagViewModel.fetchFlags() }
			}
			.background(Color.clear)
			.padding(.vertical)
			.padding(.leading, 8)
			.padding(.trailing, 16)
			
			Divider()

			TextField("Add New", text: $temporaryText)
				.onSubmit {
					guard !temporaryText.isEmpty else { return }
					let flag = Flag(id: nil, name: temporaryText, enabled: false)
					featureFlagViewModel.createNewFlag(fromFlag: flag)
					temporaryText = ""
				}
				.textFieldStyle(.plain)
				.padding(8)
			
			Divider()
				.padding(.bottom, 4)
			
			List {
				ForEach(featureFlagViewModel.flags) { flag in
					FeatureFlagItem(flag: flag) {
						featureFlagViewModel.onToggle(flag)
					}
						.listRowSeparator(.hidden)
						.swipeActions(edge: .trailing, allowsFullSwipe: true) {
							Button(role: .destructive) { featureFlagViewModel.deleteFlag(withId: flag.id) } label: {
								Label("Delete", systemImage: "trash.fill")
							}
						}
				}
			}.listStyle(.plain)
			Spacer()
		}.frame(width: 240)
	}
}

#Preview {
	MenuBarWindow()
}
