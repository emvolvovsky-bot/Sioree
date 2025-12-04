import SwiftUI

struct RootTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(AppTheme.Colors.surface)
        UITabBar.appearance().unselectedItemTintColor = UIColor(AppTheme.Colors.mutedText)
    }

    var body: some View {
        TabView {
            HomeFeedView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("Discover")
                }

            MarketplaceView()
                .tabItem {
                    Image(systemName: "music.mic")
                    Text("Marketplace")
                }

            EventCreationFlowView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Create")
                }

            MapScreenView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .tint(AppTheme.Colors.charcoal)
        .background(AppTheme.Colors.background)
        .sioreeScreenBackground()
    }
}
