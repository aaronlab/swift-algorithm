import Foundation

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
}

print(Solution().lengthOfLastWord("Hello World")) // 5
print(Solution().lengthOfLastWord(" ")) // 0
print(Solution().lengthOfLastWord("")) // 0
