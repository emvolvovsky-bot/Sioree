import SwiftUI
import MapKit

struct MapScreenView: View {
    @EnvironmentObject var store: AppDataStore
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: .init(latitudeDelta: 0.3, longitudeDelta: 0.3)
    )

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)

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
                        Color.black.opacity(0.0),
                        Color.black.opacity(0.75)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea(edges: .bottom)
            )
        }
    }
}
