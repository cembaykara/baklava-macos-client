//
//  FeaturesView.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 30.09.2024.
//

import SwiftUI

struct FeaturesView: View {
    
    @Bindable var featureFlagsViewModel = FeatureFlagsViewModel()
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
                    .onTapGesture { featureFlagsViewModel.fetchFlags() }
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
                    featureFlagsViewModel.createNewFlag(fromFlag: flag)
                    temporaryText = ""
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
                        Button(role: .destructive) { featureFlagsViewModel.deleteFlag(withId: flag.id) } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                }
            }.listStyle(.plain)
            Spacer()
        }.frame(width: 240)
    }
}
