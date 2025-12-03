import Foundation

enum AddOnCategory: String, Codable, CaseIterable, Identifiable {
    case services, talent, rentals
    var id: String { rawValue }
}

struct AddOnOption: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var estimatedCost: Double
    var category: AddOnCategory
}
