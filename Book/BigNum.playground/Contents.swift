import Foundation

func solution(_ numbers: [Int], _ m: Int, _ k: Int) -> Int {
    
    if numbers.isEmpty { fatalError("numbers needed") }
    
    let copiedNumbers = Array(Set(numbers)).sorted()
    let biggest = copiedNumbers[copiedNumbers.count - 1]
    let second = copiedNumbers[copiedNumbers.count - 2]
    
    // 6 6 6 5 6 6 6 5
    // (m / (k + 1)) * k
    // 8 / 4 ==> 2 * 3 => 6
    // ==> correct
    
    // 4 4 3 4 4 3 4
    // (m / (k + 1) * k)
    // 7 / (2 + 1) ==> 2 * 2 => 4
    // ==> should be 5
    
    var count = (m / (k + 1)) * k
    count += m % (k + 1)
    
    var answer = 0
    
    answer += count * biggest
    answer += (m - count) * second
    
    return answer
}

print(solution([2, 4, 5, 4, 6], 8, 3))
print(solution([3, 4, 3, 4, 3], 7, 2))
