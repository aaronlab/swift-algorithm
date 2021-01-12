import Foundation

struct Option {
    let name: String
    let priority: Int
    let variations: [Variation]
    let id: String
}

struct Variation {
    let value: String
    let priority: Int
    let id: String
}
