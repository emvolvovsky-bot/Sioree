import Foundation

// hello i am emil

struct Badge: Identifiable, Codable {
    let id: UUID
    let title: String
    let subtitle: String
    let iconSystemName: String
}
