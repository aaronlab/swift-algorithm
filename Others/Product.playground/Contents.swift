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

struct Variant {
    let price: Price
    let value: Int
    let id: String
}

struct Price {
    let value: Int
}

struct Sale {
    let value: Int
}

struct MyType {
    
}
