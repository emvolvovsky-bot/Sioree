import Foundation


struct TicketTier: Identifiable, Codable {
    let id: UUID
    var name: String
    var price: Double
    var includes: String
    var isSoldOut: Bool
}
