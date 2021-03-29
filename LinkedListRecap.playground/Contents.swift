import Foundation

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

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    func node(at index: Int) -> Node<Value>? {
        
        var currentIndex = 0
        var currentNode = head
        
        while (currentNode != nil && currentIndex < index) {
            
            currentNode = currentNode?.next
            currentIndex += 1
            
        }
        
        return currentNode
    }
    
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
    
    mutating func remove(after node: Node<Value>) -> Value? {
        
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    private var isEmpty: Bool {
        return head == nil
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        
        guard let head = head else {
            return "Empty List"
        }
        
        return "HEAD: \(String(describing: head)), TAIL: \(String(describing: tail))"
        
    }
    
}

var linkedList = LinkedList<Int>()

linkedList.push(3)
linkedList.push(2)
linkedList.push(1)
// ==> 1 -> 2 -> 3

linkedList.append(4)
// ==> 1 -> 2 -> 3 -> 4

let middleNode1 = linkedList.node(at: 2)! // => 3 -> 4
linkedList.insert(3, after: middleNode1)
// ==> 1 -> 2 -> 3 -> 3 -> 4

let _ = linkedList.pop() // => 1
// ==> 2 -> 3 -> 3 -> 4

let _ = linkedList.removeLast() // => 4
// ==> 2 -> 3 -> 3

let middleNode2 = linkedList.node(at: 1)! // => 3 -> 3
let _ = linkedList.remove(after: middleNode2) // => 3
// ==> 2 -> 3

print(linkedList)
