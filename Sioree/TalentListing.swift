import Foundation

struct TalentListing: Identifiable, Codable {
    let id: UUID
    let name: String
    let category: String
    let price: Double
}
