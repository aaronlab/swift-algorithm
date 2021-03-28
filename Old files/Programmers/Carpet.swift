import Foundation

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    let total = brown + yellow
    var x = Int()
    var y = Int()
    for i in 1...total {
        if total % i == 0 {
            x = total / i
            y = i
        }
        if (x - 2) * (y - 2) == yellow {
            return [x, y]
        }
    }
    return Array<Int>()
}
