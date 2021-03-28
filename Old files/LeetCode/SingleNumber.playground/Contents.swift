import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
}

print(Solution().singleNumber([2,2,1])) // ==> 1
print(Solution().singleNumber([4,1,2,1,2])) // ==> 4
print(Solution().singleNumber([1])) // ==> 1
