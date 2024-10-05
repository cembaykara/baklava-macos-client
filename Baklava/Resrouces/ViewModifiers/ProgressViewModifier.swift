//
//  ProgressViewModifier.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 06.10.2024.
//

import SwiftUI

struct ProgressViewModifier: ViewModifier {
    
    @Binding var isBusy: Bool
    
    init(isBusy: Binding<Bool>) {
        self._isBusy = isBusy
    }
    
    func body(content: Content) -> some View {
        content.overlay { if isBusy { ProgressView() } }
    }
}
