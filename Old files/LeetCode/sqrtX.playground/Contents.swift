import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
}

print(Solution().mySqrt(4)) // 2
print(Solution().mySqrt(8)) // 2
