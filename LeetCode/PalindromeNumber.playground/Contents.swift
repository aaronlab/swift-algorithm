import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        var num = x , copy = x, reversed = 0
        
        while num != 0 {
            let current = num % 10
            reversed = reversed * 10 + current
            num = num/10
        }
        
        return reversed == copy
    }
}

print(Solution().isPalindrome(121)) // => true
print(Solution().isPalindrome(-121)) // => false
print(Solution().isPalindrome(10)) // => false
print(Solution().isPalindrome(-101)) // => false
