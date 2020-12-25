import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for i in 0..<nums.count {
            let complement = target - nums[i]
            
            if let index = nums.firstIndex(of: complement), index != i {
                return [i, index]
            }
        }
        
        preconditionFailure("No Answer")
    }
}

print(Solution().twoSum([2, 7, 11, 15], 9)) // ==> [0, 1] // [1, 0]

print(Solution().twoSum([3, 2, 4], 6)) // ==> [1, 2] // [2, 1]

print(Solution().twoSum([3, 3], 6)) // ==> [0, 1] // [1, 0]

