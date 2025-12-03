import SwiftUI

@main
struct SioreeAppApp: App {
    @StateObject var auth = AuthViewModel()
    @StateObject var store = AppDataStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(auth)
                .environmentObject(store)
        }
    }
}
