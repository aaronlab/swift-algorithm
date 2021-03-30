import Foundation

struct Stack<Element> {
    
    private var storage = [Element]()
    
    init() {}
    
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        
        let top = "-----TOP-----\n"
        let bottom = "\n-----BOTTOM-----"
        
        let elements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        
        return top + elements + bottom
        
    }
    
}
