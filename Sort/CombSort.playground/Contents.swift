import Foundation

func solution(_ numbers:[Int]) {
    let answer = numbers.map{String($0)}
//        .sorted { $0 + $1 > $1 + $0 }
//        .joined()
    print(answer)
    
//    return answer.first == "0" ? "0" : answer
}

func combSort() {
    var input = [6, 10, 2]
    var copy = input
    
    var answer = input.map { String($0) }
    
    var gap = input.count
    let shrink = 1.3
    
    while gap > 1 {
        gap = Int(Double(gap) / shrink)
        if gap < 1 {
            gap = 1
        }
        
        var index = 0
        while !(index + gap >= input.count) {
            if input[index] > copy[index + gap]  {
                copy.swapAt(index, index + gap)
            }
            index += 1
        }
    }
    
    print(copy)
}

//print(solution([6, 10, 2]))
//print(solution([3, 30, 34, 5, 9]))

//solution([6, 10, 2])
//solution([3, 30, 34, 5, 9])
//solution([1000, 30, 34, 5, 9])

combSort()
//print(combSort())
