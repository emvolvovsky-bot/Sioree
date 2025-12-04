import SwiftUI

struct HomeFeedView: View {
    @EnvironmentObject var store: AppDataStore
    @State private var selectedFilter: String = "All"

    private let filters = ["All", "Collectives", "Brand activations", "Private drops", "Community"]
    private let socialSignals = [
        "Follow hosts or crews",
        "Profile badges (10+ events)",
        "Photo recaps post-event",
        "RSVP streaks & collectibles"
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 28) {
                hero
                filterBar

                VStack(spacing: 22) {
                    ForEach(filteredEvents) { event in
                        EventCardView(event: event)
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
            Text("Tonight in your orbit")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(AppTheme.Colors.charcoal)

            Text("Curated discovery for the people actually throwing culture — not algorithms chasing playlists.")
                .font(.system(size: 15))
                .foregroundColor(AppTheme.Colors.mutedText)

            GlassCard {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Social & community layer")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppTheme.Colors.charcoal)

                    Text("Follow hosts or collectives, flex verified badges, unlock recap feeds post-event, and keep RSVP streaks alive.")
                        .font(.system(size: 13))
                        .foregroundColor(AppTheme.Colors.mutedText)

                    WrapHStack(data: socialSignals, spacing: 10, lineSpacing: 10) { value in
                        Text(value)
                            .font(.system(size: 11, weight: .medium))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(AppTheme.Colors.surfaceMuted)
                            .cornerRadius(AppTheme.Radii.pill)
                            .foregroundColor(AppTheme.Colors.charcoal)
                    }
                }
            }
        }
    }

    private var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(filters, id: \.self) { filter in
                    Button {
                        selectedFilter = filter
                    } label: {
                        Text(filter)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                                    .fill(selectedFilter == filter ? AppTheme.Colors.charcoal : AppTheme.Colors.surface)
                            )
                            .foregroundColor(selectedFilter == filter ? .white : AppTheme.Colors.mutedText)
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

    private var filteredEvents: [Event] {
        switch selectedFilter {
        case "Brand activations":
            return store.events.filter { $0.title.lowercased().contains("brand") }
        case "Collectives":
            return store.events.filter { $0.description.lowercased().contains("crew") || $0.description.lowercased().contains("collective") }
        case "Private drops":
            return store.events.filter { $0.description.lowercased().contains("guest") || $0.description.lowercased().contains("invite") }
        case "Community":
            return store.events.filter { $0.description.lowercased().contains("community") }
        default:
            return store.events
        }
    }
}
