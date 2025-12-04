//
//  SioreeButtonStyle.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct SioreeButtonStyle: ButtonStyle {
    let isGhost: Bool
    var fullWidth: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .padding(.vertical, 16)
            .foregroundColor(isGhost ? AppTheme.Colors.strongText : AppTheme.Colors.charcoal)
            .background(background(isPressed: configuration.isPressed))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.18), value: configuration.isPressed)
    }

    @ViewBuilder
    private func background(isPressed: Bool) -> some View {
        RoundedRectangle(cornerRadius: AppTheme.Radii.tile, style: .continuous)
            .fill(isGhost ? Color.clear : AppTheme.Gradients.halo)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.Radii.tile, style: .continuous)
                    .stroke(
                        isGhost ? AppTheme.Colors.borderBold : Color.white.opacity(isPressed ? 0.8 : 0.5),
                        lineWidth: 1.3
                    )
            )
            .shadow(
                color: isGhost ? Color.clear : AppTheme.Colors.accent.opacity(isPressed ? 0.15 : 0.35),
                radius: isGhost ? 0 : 22,
                x: 0,
                y: 16
            )
            .opacity(isGhost ? (isPressed ? 0.85 : 1.0) : 1.0)
    }
}

extension View {
    func sioreePrimary(fullWidth: Bool = true) -> some View {
        buttonStyle(SioreeButtonStyle(isGhost: false, fullWidth: fullWidth))
    }

    func sioreeGhost(fullWidth: Bool = true) -> some View {
        buttonStyle(SioreeButtonStyle(isGhost: true, fullWidth: fullWidth))
    }
}
