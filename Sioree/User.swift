import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var role: UserRole
    var city: String
    var badges: [Badge]
    var eventsAttended: Int
}
