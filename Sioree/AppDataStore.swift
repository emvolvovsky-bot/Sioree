import SwiftUI

class AppDataStore: ObservableObject {
    @Published var events: [Event] = MockData.events
    @Published var talents: [TalentListing] = MockData.talents
}
