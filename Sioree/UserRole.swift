enum UserRole: String, CaseIterable, Identifiable, Codable {
    case host, partier, talent, brand
    var id: String { rawValue }
}
