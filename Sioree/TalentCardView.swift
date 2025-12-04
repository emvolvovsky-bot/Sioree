import SwiftUI

struct TalentCardView: View {
    let talent: TalentListing
    var highlight: String = "All talent"

    var body: some View {
        GlassCard {
            HStack(spacing: 18) {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(AppTheme.Colors.surfaceMuted)
                    .frame(width: 88, height: 88)
                    .overlay(
                        VStack {
                            Image(systemName: iconName)
                                .font(.system(size: 26, weight: .semibold))
                            Text(talent.category.uppercased())
                                .font(.system(size: 10, weight: .heavy))
                        }
                        .foregroundColor(AppTheme.Colors.charcoal)
                    )

                VStack(alignment: .leading, spacing: 8) {
                    Text(talent.name)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppTheme.Colors.charcoal)

                    Text(copyForHighlight)
                        .font(.system(size: 13))
                        .foregroundColor(AppTheme.Colors.mutedText)
                        .fixedSize(horizontal: false, vertical: true)

                    HStack(spacing: 12) {
                        Text("$\(Int(talent.price)) \(priceSuffix)")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        Text("Verified • 4.9 ★")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                Spacer()

                Image(systemName: "arrow.up.right")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppTheme.Colors.charcoal)
            }
        }
    }

    private var iconName: String {
        switch highlight {
        case "Brands":
            return "briefcase.fill"
        case "Add-ons":
            return "wand.and.stars"
        case "Teams":
            return "person.2.wave.2"
        default:
            return "sparkles"
        }
    }

    private var copyForHighlight: String {
        switch highlight {
        case "Brands":
            return "Looking to sponsor launches or cultural pop-ups. Plug directly into Sioree hosts."
        case "Add-ons":
            return "Perfect for on-demand lighting, decor, and custom blends to match the event theme."
        case "Teams":
            return "Ready to embed with host crews for ongoing residencies, payments via Stripe/PayPal."
        default:
            return "Services like DJing, rentals, photography, bartending — complete with availability & reviews."
        }
    }

    private var priceSuffix: String {
        highlight == "Add-ons" ? "package" : "flat"
    }
}
