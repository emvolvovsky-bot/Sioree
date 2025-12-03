//
//  PillToggle.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct PillToggle: View {
    let title: String
    let isSelected: Bool
    let icon: String?

    var body: some View {
        HStack(spacing: 8) {
            if let icon {
                Image(systemName: icon)
            }
            Text(title)
        }
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                .fill(isSelected ? AppTheme.Colors.accent.opacity(0.18) : Color.white.opacity(0.02))
        )
        .overlay(
            RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                .stroke(isSelected ? AppTheme.Colors.accent : AppTheme.Colors.border, lineWidth: 1.1)
        )
        .foregroundColor(.white)
    }
}
