import Foundation

//func solution(_ priorities:[Int], _ location:Int) -> Int {
//
//    var queue = [(Int, Int)]()
//    var priorityQueue = [Int]()
//
//    for i in 0..<priorities.count {
//        let priority = priorities[i]
//        queue.append((priority, i))
//        priorityQueue.append(priority)
//    }
//
//    priorityQueue.sort(by: >)
//    var answer = 0
//    while !queue.isEmpty {
//        let topPriority = priorityQueue.first
//
//        let document = queue.removeFirst()
//
//        if topPriority == document.0 {
//            answer += 1
//            priorityQueue.remove(at: 0)
//
//            if document.1 == location {
//                break
//            }
//        } else {
//            queue.append(document)
//        }
//
//
//    }
//
//    return answer
//}

func solution(_ priorities:[Int], _ location:Int) -> Int {

    var queue = [Document]()
    var priorities = priorities

    // Queue에 추가(Location 식별)
    for i in 0..<priorities.count {
        let priority = priorities[i]
        queue.append(Document(priority: priority, location: i))
    }
    
    priorities.sort(by: >)
    
    var answer = 0
    while !queue.isEmpty {
        let highestPriority = priorities[0]
        let document = queue.removeFirst()

        if highestPriority == document.priority {

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
// 3 2 2 1
// [2: 0] [1: 1] [3: 2] [2: 3]
print(solution([1, 1, 9, 1, 1, 1], 0)) // ==> 5
/*
 9 1 1 1 1 1
 [1: 0] [1: 1] [9: 2] [1: 3] [1: 4] [1: 5]
 [9: 2] [1: 3] [1: 4] [1: 5] [1: 0] [1: 1]
 
 answer = 0 + 1
 1 1 1 1 1
 [1: 3] [1: 4] [1: 5] [1: 0] [1: 1]
 [9: 2]의 location != 0
 
 answer = 1 + 1
 1 1 1 1
 [1: 4] [1: 5] [1: 0] [1: 1]
 [1: 3]의 location != 0
 
 answer = 2 + 1
 1 1 1
 [1: 5] [1: 0] [1: 1]
 [1: 4]의 location != 0
 
 answer = 3 + 1
 1 1
 [1: 0] [1: 1]
 [1: 5]의 location != 0
 
 answer = 4 + 1
 1
 [1: 1]
 [1: 0]의 location == 0
 break
*/
