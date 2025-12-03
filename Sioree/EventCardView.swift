import SwiftUI

struct EventCardView: View {
    let event: Event

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                // Poster / banner
                ZStack(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.18, green: 0.18, blue: 0.22),
                                    Color(red: 0.04, green: 0.04, blue: 0.06)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .overlay(
                            LinearGradient(
                                colors: [AppTheme.Colors.accentWarm.opacity(0.4),
                                         .clear],
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing
                            )
                                .blendMode(.screen)
                        )

                    VStack(alignment: .leading, spacing: 4) {
                        Text(event.title.uppercased())
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .foregroundColor(.white)

                        Text(event.city)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(12)
                }
                .frame(height: 170)

                // Details row
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hosted by independent creators")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(AppTheme.Colors.strongText)

                        Text(event.description)
                            .font(.system(size: 12))
                            .foregroundColor(AppTheme.Colors.mutedText)
                            .lineLimit(2)
                    }

                    Spacer(minLength: 12)

                    VStack(alignment: .trailing, spacing: 8) {
                        if let cheapest = event.ticketTiers.min(by: { $0.price < $1.price }) {
                            Text("from")
                                .font(.system(size: 10))
                                .foregroundColor(AppTheme.Colors.mutedText)

                            Text("$\(Int(cheapest.price))")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.Colors.accent)
                        }

                        Text("Tickets · Limited")
                            .font(.system(size: 11))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                // Tags
                HStack(spacing: 8) {
                    tag("Rooftop")
                    tag("Nightlife")
                    tag("Sioree Verified")
                }
            }
        }
    }

    private func tag(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 10, weight: .medium))
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                    .fill(Color.white.opacity(0.04))
            )
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.Radii.pill, style: .continuous)
                    .stroke(AppTheme.Colors.border, lineWidth: 0.8)
            )
            .foregroundColor(AppTheme.Colors.mutedText)
    }
}
