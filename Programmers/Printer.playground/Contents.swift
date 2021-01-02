import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue = [(Int, Int)]()
    var priorityQueue = [Int]()
    
    for i in 0..<priorities.count {
        let priority = priorities[i]
        queue.append((priority, i))
        priorityQueue.append(priority)
    }
    
    priorityQueue.sort(by: >)
    var answer = 0
    while !queue.isEmpty {
        let topPriority = priorityQueue.first
        
        let document = queue.removeFirst()
        
        if topPriority == document.0 {
            answer += 1
            priorityQueue.remove(at: 0)
            
            if document.1 == location {
                break
            }
        } else {
            queue.append(document)
        }


    }
    
    return answer
}

print(solution([2, 1, 3, 2], 2)) // ==> 1
print(solution([1, 1, 9, 1, 1, 1], 0)) // ==> 5
