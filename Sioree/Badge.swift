import Foundation

struct Badge: Identifiable, Codable {
    let id: UUID
    let title: String
    let subtitle: String
    let iconSystemName: String
}
