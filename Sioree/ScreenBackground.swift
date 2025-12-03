//
//  ScreenBackground.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct ScreenBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            AppTheme.Gradients.subtleGlow
                .ignoresSafeArea()
            content
        }
    }
}

extension View {
    func sioreeScreenBackground() -> some View {
        modifier(ScreenBackground())
    }
}
