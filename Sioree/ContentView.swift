import SwiftUI


struct ContentView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        ZStack {
            AppTheme.Colors.background
                .ignoresSafeArea()

            Group {
                if auth.isAuthenticated {
                    RootTabView()
                } else {
                    NavigationView {
                        AuthView()
                    }
                    .navigationViewStyle(.stack)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
