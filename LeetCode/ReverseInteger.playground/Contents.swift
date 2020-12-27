import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var answer = 0
        if x == 0 { return answer }
        
        var nums = Array(String(x))
        
        if x < 0 {
            nums.remove(at: 0)
        }
        
        nums.reverse()
        answer = x < 0 ? -Int(String(nums))! : Int(String(nums))!
        
        if answer > Int32.max || answer < Int32.min {
            return 0
        }
        
        return answer
    }
}

print(Solution().reverse(123)) // ==> 321

print(Solution().reverse(-123)) // ==> -321

print(Solution().reverse(120)) // ==> 21

print(Solution().reverse(0)) // ==> 0

print(Solution().reverse(2147483648)) // ==> 0
