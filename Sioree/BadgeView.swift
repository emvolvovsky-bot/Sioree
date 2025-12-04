import SwiftUI

struct BadgeView: View {
    let badge: Badge

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(AppTheme.Colors.accent.opacity(0.18))
                    .frame(width: 32, height: 32)

                Image(systemName: badge.iconSystemName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(AppTheme.Colors.accent)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(badge.title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(AppTheme.Colors.charcoal)

                Text(badge.subtitle)
                    .font(.system(size: 11))
                    .foregroundColor(AppTheme.Colors.mutedText)
            }

            Spacer()
        }
    }
}
