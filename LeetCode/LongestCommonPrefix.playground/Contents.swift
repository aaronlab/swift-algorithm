import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        let shortest = strs.min { $0.count < $1.count }!
        var prefix = shortest
        for word in strs {
            while !word.hasPrefix(prefix), prefix.count > 0 {
                prefix.removeLast()
            }
            if prefix.count == 0 { return "" }
        }
        return prefix
    }
}

print(Solution().longestCommonPrefix(["flower","flow","flight"])) // ==> "fl"
print(Solution().longestCommonPrefix(["dog","racecar","car"])) // ==> ""
print(Solution().longestCommonPrefix(["cir","car"])) // ==> "c"
