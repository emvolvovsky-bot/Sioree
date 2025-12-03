import Foundation

// hello

struct Badge: Identifiable, Codable {
    let id: UUID
    let title: String
    let subtitle: String
    let iconSystemName: String
}
