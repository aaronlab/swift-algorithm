import Foundation

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    mutating func push(_ value: Value) {
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
        
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init() {}
    
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        
        guard let head = head else {
            return "Empty"
        }
        
        return String(describing: head)
        
    }
    
}

class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    
    var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
        
    }
    
}

var linkedList = LinkedList<Int>()

linkedList.push(1)
linkedList.push(2)
linkedList.push(3)

print(linkedList)
