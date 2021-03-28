import Foundation

func solution(cards: [[Int]]) -> Int {
    
    var answer = 0
    
    for line in cards {
        guard let newNum = line.min() else { continue }
        answer = max(answer, newNum)
    }
    
    return answer
}

print(solution(cards: [[3, 1, 2], [4, 1, 4], [2, 2, 2]])) // => 2
print(solution(cards: [[7, 3, 1, 8], [3, 3, 3, 4]])) // => 3
