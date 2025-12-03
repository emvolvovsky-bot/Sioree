import Foundation

struct Event: Identifiable, Codable {
    let id: UUID
    var title: String
    var city: String
    var description: String
    var ticketTiers: [TicketTier]
    var addOns: [AddOnOption]
}
