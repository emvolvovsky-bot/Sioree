import SwiftUI

struct EventCardView: View {
    let event: Event

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 16) {
                headerBanner

                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(event.title)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        Text(event.description)
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                            .lineLimit(2)
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text("from")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(AppTheme.Colors.mutedText)

                        if let cheapest = event.ticketTiers.min(by: { $0.price < $1.price }) {
                            Text("$\(Int(cheapest.price))")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(AppTheme.Colors.charcoal)
                        }

                        Text("Enable monetization")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(AppTheme.Colors.accentWarm)
                    }
                }

                Divider().overlay(AppTheme.Colors.border.opacity(0.6))

                VStack(alignment: .leading, spacing: 10) {
                    Text("Teams, payouts, analytics")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(AppTheme.Colors.charcoal)

                    WrapHStack(
                        data: ["Team dashboard", "Stripe + PayPal", "Realtime views", "Talent marketplace", "Map-ready"],
                        spacing: 8,
                        lineSpacing: 8
                    ) { item in
                        tag(item)
                    }
                }
            }
        }
    }

    private var headerBanner: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            AppTheme.Colors.surfaceMuted,
                            Color.white
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    LinearGradient(
                        colors: [
                            AppTheme.Colors.accent.opacity(0.6),
                            Color.clear
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .opacity(0.4)
                )

            VStack(alignment: .leading, spacing: 8) {
                Text(event.city.uppercased())
                    .font(.system(size: 11, weight: .heavy))
                    .foregroundColor(AppTheme.Colors.charcoal)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(AppTheme.Radii.pill)

                Text("Collective owned · RSVPs live on map")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(AppTheme.Colors.charcoal)
            }
            .padding(18)
        }
        .frame(height: 160)
    }

    private func tag(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(AppTheme.Colors.surfaceMuted)
            .foregroundColor(AppTheme.Colors.charcoal)
            .cornerRadius(AppTheme.Radii.pill)
    }
}
