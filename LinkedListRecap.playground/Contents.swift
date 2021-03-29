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
    
    mutating func append(_ value: Value) {
        
        if head == nil {
            
            push(value)
            
        } else {
            
            let node = Node(value: value)
            tail!.next = node
            tail = node
            
        }
        
    }
    
    func node(at index: Int) -> Node<Value>? {
        
        var currentIndex = 0
        var currentNode = head
        
        while (currentNode != nil && currentIndex < index) {
            
            currentNode = currentNode?.next
            currentIndex += 1
            
        }
        
        return currentNode
        
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>) {
        
        node.next = Node(value: value, next: node.next)
        
    }
    
    mutating func pop() -> Value? {
        
        defer {
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
        
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
        
        return "HEAD: \(String(describing: head)), TAIL: \(String(describing: tail))"
        
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
linkedList.append(0)

let node = linkedList.node(at: 1)!
linkedList.insert(99, after: node)

_ = linkedList.pop()

_ = linkedList.removeLast()

print(linkedList)
