import SwiftUI

struct MarketplaceView: View {
    @EnvironmentObject var store: AppDataStore

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Talent & Services")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 12)

                Text("Book DJs, photographers, bartenders, rentals & more.")
                    .font(.system(size: 13))
                    .foregroundColor(AppTheme.Colors.mutedText)

                ForEach(store.talents) { t in
                    TalentCardView(talent: t)
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .sioreeScreenBackground()
    }
}
