import Foundation

func solution(_ progress: [Int], _ speeds: [Int]) -> [Int] {
    
    let remainings = progress.map { 100 - $0 }
    var queue = [Int]()
    var answer = [Int]()
    
    for i in 0..<progress.count {
        let day = Int(ceil(Double(remainings[i]) / Double(speeds[i])))
        queue.append(day)
    }
    
//    while !queue.isEmpty {
//        let poppedQueue = queue.first!
//        var queueCount = 0
//
//        while !queue.isEmpty && queue.first! <= poppedQueue {
//            queueCount += 1
//            queue.removeFirst()
//        }
//        answer.append(queueCount)
//    }
    
    var index = 0
    while index < queue.count {
        let poppedQueue = queue[index]
        var queueCount = 0
        while index < queue.count && queue[index] <= poppedQueue {
            queueCount += 1
            index += 1
        }
        answer.append(queueCount)
    }
    
    return answer
}

// MARK: - TEST

struct TestModel {
    let progress: [Int]
    let speeds: [Int]
    let result: [Int]
}

let questions = [
TestModel(progress: [93, 30, 55], speeds: [1, 30, 5], result: [2, 1]),
TestModel(progress: [95, 90, 99, 99, 80, 99], speeds: [1, 1, 1, 1, 1, 1], result: [1, 3, 2])]

func test(questions: [TestModel]) {
    for question in questions {
        print(solution(question.progress, question.speeds) == question.result)
    }
}

test(questions: questions)
