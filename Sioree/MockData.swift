import Foundation

struct MockData {
    static let events: [Event] = [
        Event(
            id: UUID(),
            title: "SIoReE Rooftop Party",
            city: "NYC",
            description: "Guest-list only. Rooftop open bar + DJ set.",
            ticketTiers: [
                TicketTier(id: UUID(), name: "General", price: 20, includes: "Entry", isSoldOut: false),
                TicketTier(id: UUID(), name: "VIP", price: 50, includes: "VIP section", isSoldOut: false)
            ],
            addOns: [
                AddOnOption(id: UUID(), name: "Security", description: "Night-of guards", estimatedCost: 200, category: .services),
                AddOnOption(id: UUID(), name: "DJ", description: "Local DJ hire", estimatedCost: 400, category: .talent)
            ]
        )
    ]

    static let talents: [TalentListing] = [
        TalentListing(id: UUID(), name: "DJ Miro", category: "DJ", price: 350),
        TalentListing(id: UUID(), name: "Photographer Lena", category: "Photographer", price: 250)
    ]
}
