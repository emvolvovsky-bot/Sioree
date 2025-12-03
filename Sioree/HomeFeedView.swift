import SwiftUI

struct HomeFeedView: View {
    @EnvironmentObject var store: AppDataStore

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                header

                ForEach(store.events) { event in
                    EventCardView(event: event)
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .sioreeScreenBackground()
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Tonight in your orbit")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(AppTheme.Colors.strongText)

            Text("Curated by hosts, collectives & crews — not algorithms.")
                .font(.system(size: 13))
                .foregroundColor(AppTheme.Colors.mutedText)
        }
    }
}
