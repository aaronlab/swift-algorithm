import Foundation

func solution(_ numbers: [Int], _ m: Int, _ k: Int) -> Int {
    
    if numbers.isEmpty { fatalError("numbers needed") }
    
    let copiedNumbers = numbers.sorted()
    let biggest = copiedNumbers[copiedNumbers.count - 1]
    let second = copiedNumbers[copiedNumbers.count - 2]
    
    var times = m
    
    var answer = 0
    
    while true {
        
        for _ in 0..<k {
            
            if times == 0 { break }
            
            answer += biggest
            times -= 1
            
        }
        
        if times == 0 { break }
        
        answer += second
        times -= 1
        
    }
    
    return answer
}

print(solution([2, 4, 5, 4, 6], 8, 3))
print(solution([3, 4, 3, 4, 3], 7, 2))
