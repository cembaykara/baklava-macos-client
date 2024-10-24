//
//  FeaturesView.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 30.09.2024.
//

import SwiftUI

struct FeaturesView: View {
	
	@Environment(\.appState) var appState
    
    @Bindable var featureFlagsViewModel = FeatureFlagsViewModel()
    @State private var temporaryText: String = ""
    @State private var isBusy: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
			HStack(spacing: 0) {
				Image(systemName: "person.circle")
					.imageScale(.large)
					.background(Color.clear)
					.padding(.leading, 8)
					.onTapGesture {
						appState.signOut()
					}
				
                Spacer()
                
                Text("Feature Flags")
                    .bold()
                
                Spacer()
                
                Image(systemName: "arrow.clockwise")
                    .imageScale(.large)
                    .onTapGesture { featureFlagsViewModel.fetchFlags() }
                    .padding(.trailing, 8)
            }
            .background(Color.clear)
            .padding(.vertical)
            
            Divider()
            
            TextField("Add New", text: $temporaryText)
                .onSubmit {
                    Task {
                        isBusy = true
                        guard !temporaryText.isEmpty else { return }
                        let flag = Flag(id: nil, name: temporaryText, enabled: false)
                        await featureFlagsViewModel.createNewFlag(fromFlag: flag)
                        temporaryText = ""
                        isBusy = false
                    }
                }
                .textFieldStyle(.plain)
                .padding(8)
            
            Divider()
                .padding(.bottom, 4)
            
            List {
                ForEach(featureFlagsViewModel.flags ?? []) { flag in
                    FeatureFlagItem(flag: flag) {
                        featureFlagsViewModel.onToggle(flag)
                    }
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            Task {
                                isBusy = true
                                await featureFlagsViewModel.deleteFlag(withId: flag.id)
                                isBusy = false
                            }
                        }
                        label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .scrollBounceBehavior(.always)
            
            Spacer()
        }
		.frame(height: 320)
		.isBusy($isBusy)
    }
}

#Preview {
//	FeaturesView()
	MenuBarWindow()
}
