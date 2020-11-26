import Foundation

func solution(_ numbers:[Int]) -> String {
    let answer: String = numbers.map{String($0)}.sorted { $0 + $1 > $1 + $0 }.joined()
    
    return answer.first == "0" ? "0" : answer
}

print(solution([6, 10, 2]))
print(solution([3, 30, 34, 5, 9]))
