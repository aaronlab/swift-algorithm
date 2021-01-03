import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        
        var dict = [Int: Int]()
        
        for i in 0..<nums.count {
            guard dict[nums[i]] != nil
            else {
                dict[nums[i]] = 1
                continue
            }
            dict[nums[i]]! += 1
        }
        
        guard let key = dict.filter({ $0.value == 1 }).keys.first else { return 0 }
        
        return key
    }
}

print(Solution().singleNumber([2,2,1])) // ==> 1
print(Solution().singleNumber([4,1,2,1,2])) // ==> 4
print(Solution().singleNumber([1])) // ==> 1
