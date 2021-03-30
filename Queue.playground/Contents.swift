import Foundation

struct Queue<T> {
    
    var array: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
}
