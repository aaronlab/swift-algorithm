import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var length = 0
        var chars = [Character]()
        for c in s {
            if let index = chars.firstIndex(of: c) {
                length = max(length, chars.count)
                chars.removeSubrange(0...index)
            }
            chars.append(c)
        }
        return max(length, chars.count)
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb")) // ==> 3
print(Solution().lengthOfLongestSubstring("bbbbb")) // ==> 1
print(Solution().lengthOfLongestSubstring("pwwkew")) // ==> 3
print(Solution().lengthOfLongestSubstring("")) // ==> 0
