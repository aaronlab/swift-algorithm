import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        return Array(String(x)).reversed() == Array(String(x))
    }
}

print(Solution().isPalindrome(121)) // => true
print(Solution().isPalindrome(-121)) // => false
print(Solution().isPalindrome(10)) // => false
print(Solution().isPalindrome(-101)) // => false
