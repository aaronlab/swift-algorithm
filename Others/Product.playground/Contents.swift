import Foundation

struct Product {
    let options: [Option]
    let variants: [Variant]
}

extension Product {
    
    var allOptions: [String: [String]] {
        var options = [String: [String]]()
        
        for option in self.options {
            var variations = [String]()
            for variation in option.variations {
                
                variations.append(variation.value)
            }
            options[option.name] = variations
        }
        
        return options
    }
    
}

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
    let sale: Sale
    let id: String
    let types: [MyType]
}

extension Variant {
    
    var allValues: [String] {
        var values = [String]()
        for type in self.types {
            values.append(type.variation.value)
        }
        return values
    }
    
}

struct Price {
    let value: Int
}

struct Sale {
    let value: Int
}

struct MyType {
    let option: MyOption
    let variation: MyVariation
}

struct MyOption {
    let name: String
    let priority: Int
    let id: String
}

struct MyVariation {
    let value: String
    let priority: Int
    let id: String
}

let product = Product(
    options: [
        Option(
            name: "Color",
            priority: 0,
            variations: [
                Variation(value: "White", priority: 0, id: "w"),
                Variation(value: "Black", priority: 1, id: "b")
            ],
            id: "color"
        ),
        Option(
            name: "Size",
            priority: 1,
            variations: [
                Variation(value: "S", priority: 0, id: "m"),
                Variation(value: "M", priority: 1, id: "s"),
                Variation(value: "L", priority: 2, id: "l"),
                Variation(value: "XL", priority: 3, id: "xl")
            ],
            id: "size"
        ),
    ],
    variants: [
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "wm", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "white", priority: 0, id: "w")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "M", priority: 0, id: "m")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "ws", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "White", priority: 0, id: "w")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "S", priority: 0, id: "s")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "wl", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "White", priority: 0, id: "w")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "L", priority: 0, id: "l")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "wxl", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "White", priority: 0, id: "w")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "XL", priority: 0, id: "xl")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "bs", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "Black", priority: 0, id: "b")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "S", priority: 0, id: "s")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "bm", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "Black", priority: 0, id: "b")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "M", priority: 0, id: "m")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "bl", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "Black", priority: 0, id: "b")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "L", priority: 0, id: "l")
                )
            ]
        ),
        Variant(
            price: Price(value: 1000),
            sale: Sale(value: 1000),
            id: "bxl", types: [
                MyType(
                    option: MyOption(name: "Color", priority: 0, id: "color"),
                    variation: MyVariation(value: "Black", priority: 0, id: "b")
                ),
                MyType(
                    option: MyOption(name: "Size", priority: 0, id: "size"),
                    variation: MyVariation(value: "XL", priority: 0, id: "xl")
                )
            ]
        )
    ]
)

print(product.allOptions)


func getSelectedVariantId(product: Product, selectedValues: [String]) -> String {
    let variants = product.variants
    
    for variant in variants {
        
        if variant.allValues == selectedValues {
            
            return variant.id
        }
        
    }
    
    preconditionFailure("Not Found Id")
}

let selectedOptions = ["White", "S"]

print(getSelectedVariantId(product: product, selectedValues: selectedOptions))

func getPlaceHolderValues(with product: Product) -> [String] {
    var placeholder = [String]()
    let allOptions = product.allOptions
    for (_, values) in allOptions {
        
        if values.contains("L") {
            placeholder.append("L")
        } else {
            placeholder.append(values[0])
        }
    }
    return placeholder
}

let placeHolder = getPlaceHolderValues(with: product)
print("Placeholder: \(placeHolder)")
let placeHolderId = getSelectedVariantId(product: product, selectedValues: placeHolder)
print(placeHolderId)
