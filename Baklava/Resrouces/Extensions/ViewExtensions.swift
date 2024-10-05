//
//  Extensions.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 06.10.2024.
//

import SwiftUI

extension View {
    
    func isBusy(_ isAnimating: Binding<Bool>) -> some View {
        modifier(ProgressViewModifier(isBusy: isAnimating))
    }
}
