import SwiftUI

struct MarketplaceView: View {
    @EnvironmentObject var store: AppDataStore
    @State private var selectedCategory: String = "All talent"

    private let categories = ["All talent", "Add-ons", "Brands", "Teams"]
    private let hostFeatures = [
        ("Event hosting & management", "Create teams, ticket tiers, media, analytics, payouts."),
        ("Custom events", "Mix unique venues, performers, services, and instantly preview budgets."),
        ("Service matching", "Auto-connects hosts with verified local providers, ready to save & repeat.")
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                hero
                categoryBar

                VStack(spacing: 18) {
                    ForEach(store.talents) { talent in
                        TalentCardView(talent: talent, highlight: selectedCategory)
                    }
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 60)
        }
        .sioreeScreenBackground()
    }

    private var hero: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Marketplace")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(AppTheme.Colors.charcoal)

            Text("A peer-to-peer system for rentals, DJs, bartenders, photographers, cleaning crews, and brand partners — all with reviews, verified IDs, and transparent pricing.")
                .font(.system(size: 15))
                .foregroundColor(AppTheme.Colors.mutedText)

            GlassCard {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(hostFeatures, id: \.0) { feature in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(feature.0)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(AppTheme.Colors.charcoal)
                            Text(feature.1)
                                .font(.system(size: 13))
                                .foregroundColor(AppTheme.Colors.mutedText)
                        }

                        if feature.0 != hostFeatures.last?.0 {
                            Divider().background(AppTheme.Colors.border)
                        }
                    }
                }
            }
        }
    }

    private var categoryBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(categories, id: \.self) { category in
                    Button {
                        selectedCategory = category
                    } label: {
                        Text(category)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                                    .fill(selectedCategory == category ? AppTheme.Colors.charcoal : AppTheme.Colors.surface)
                            )
                            .foregroundColor(selectedCategory == category ? .white : AppTheme.Colors.mutedText)
                            .overlay(
                                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                                    .stroke(AppTheme.Colors.border, lineWidth: 1)
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 4)
        }
    }
}
