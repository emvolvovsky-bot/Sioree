import SwiftUI
import MapKit

struct MapScreenView: View {
    @EnvironmentObject var store: AppDataStore
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: .init(latitudeDelta: 0.3, longitudeDelta: 0.3)
    )

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)

            VStack {
                GlassCard {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Map integration")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)
                        Text("Live events + listings on Mapbox / Google Maps. Cluster by region, filter by price, distance, or type (party, rave, concert, activation).")
                            .font(.system(size: 12))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 40)

                Spacer()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(store.events) { event in
                            EventCardView(event: event)
                                .frame(width: 260)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                }
                .background(
                    LinearGradient(
                        colors: [
                            Color.clear,
                            AppTheme.Colors.background.opacity(0.95)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea(edges: .bottom)
                )
            }
        }
    }
}
