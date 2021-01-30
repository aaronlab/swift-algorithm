import Foundation

func solution(_ n: Int) -> Int {
    
    var count = 0
    
    for i in 0..<n + 1 {
        // hrs
        for j in 0..<60 {
            for k in 0..<60 {
                // secs
                if "\(i)\(j)\(k)".contains("3") {
                    count += 1
                }
            }
        }
    }
    
    return count
}

print(solution(5))
