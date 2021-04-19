import Foundation

struct Stack<Element> {
    
    private var storage = [Element]()
    
    init() {}
    
    mutating func append(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
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

var stack = Stack<Int>()

stack.append(1)
stack.append(2)
stack.append(3)
stack.append(4)
stack.append(5)

let last = stack.pop()!
print(last)

print(stack)
