import SwiftUI

struct TalentCardView: View {
    let talent: TalentListing

    var body: some View {
        GlassCard {
            HStack(spacing: 14) {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.23, green: 0.23, blue: 0.30),
                                Color(red: 0.09, green: 0.09, blue: 0.14)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 76, height: 76)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white.opacity(0.85))
                    )

                VStack(alignment: .leading, spacing: 6) {
                    Text(talent.name)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)

                    Text(talent.category)
                        .font(.system(size: 12))
                        .foregroundColor(AppTheme.Colors.mutedText)

                    HStack(spacing: 8) {
                        Text("$\(Int(talent.price)) flat")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(AppTheme.Colors.accent)

                        Text("Verified • 4.9 ★")
                            .font(.system(size: 11))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(AppTheme.Colors.mutedText)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
}
