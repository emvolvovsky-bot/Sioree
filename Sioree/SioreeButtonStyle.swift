//
//  SioreeButtonStyle.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct SioreeButtonStyle: ButtonStyle {
    let isGhost: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(.headline, design: .rounded))
            .foregroundColor(isGhost ? AppTheme.Colors.strongText : .black)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(
                Group {
                    if isGhost {
                        RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                            .stroke(AppTheme.Colors.accent, lineWidth: 1.2)
                            .background(
                                RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                                    .fill(Color.clear)
                            )
                    } else {
                        RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                            .fill(AppTheme.Gradients.hero)
                    }
                }
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.8), value: configuration.isPressed)
    }
}

extension Button where Label == Text {
    func sioreePrimary() -> some View {
        self.buttonStyle(SioreeButtonStyle(isGhost: false))
    }

    func sioreeGhost() -> some View {
        self.buttonStyle(SioreeButtonStyle(isGhost: true))
    }
}
