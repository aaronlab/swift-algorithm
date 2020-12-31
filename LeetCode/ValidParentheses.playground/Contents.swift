import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count == 0 { return true }
        if s.count == 1 { return false }
        
        var open = [UnicodeScalar]()
        for i in Array(s.unicodeScalars) {
            if i == "{" || i == "[" || i == "(" {
                open.append(i)
            } else {
                guard let check = open.last?.value else { return false }
                if (check + 1 == i.value) || (check + 2 == i.value) {
                    open.removeLast()
                } else {
                    break
                }
            }
        }
        return open.isEmpty
    }
}

print(Solution().isValid("()")) // ==> T
print(Solution().isValid("()[]{}")) // ==> T
print(Solution().isValid("(]")) // ==> F
print(Solution().isValid("([)]")) // ==> F
print(Solution().isValid("{[]}")) // ==> T
print(Solution().isValid("(")) // ==> F
print(Solution().isValid("){")) // ==> F
print(Solution().isValid("(){}}{")) // ==> F
