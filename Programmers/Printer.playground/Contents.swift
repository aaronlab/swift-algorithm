import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue = [Document]()
    var priorities = priorities
    
    for i in 0..<priorities.count {
        queue.append(Document(priority: priorities[i], location: i))
    }
    
    priorities.sort(by: >)
    
    var answer = 0
    
    while true {
        let highestPriority = priorities[0]
        let document = queue[0]
        queue.remove(at: 0)
        
        if document.priority == highestPriority {
            
            answer += 1
            priorities.remove(at: 0)
            
            if document.location == location {
                break
            }
        } else {
            queue.append(document)
        }
    }
    
    return answer
}

struct Document {
    let priority: Int
    let location: Int
}

print(solution([2, 1, 3, 2], 2)) // ==> 1
print(solution([1, 1, 9, 1, 1, 1], 0)) // ==> 5
