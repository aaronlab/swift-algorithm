import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if (nums.count == 0) { return 0 }
        var i = 0;
        for j in 1..<nums.count{
            if (nums[j] != nums[i]) {
                i = i + 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}

var problem1 = [1, 1, 2]
print(Solution().removeDuplicates(&problem1)) // ==> 2

var problem2 = [0,0,1,1,1,2,2,3,3,4]
print(Solution().removeDuplicates(&problem2)) // => 5
