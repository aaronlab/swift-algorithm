import Foundation

class Solution {
    
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        let maps: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        
        var strings = [String]()
        for d in digits {
            if let s = maps[d] {
                strings.append(s)
            }
        }
        
        var combinations = [String]()
        letterCombinations(0, strings, "", &combinations)
        return combinations
    }
    
    func letterCombinations(_ index: Int, _ strings: [String], _ carry: String, _ combinations: inout [String]) {
        if index >= strings.count {
            combinations.append(carry)
            return
        }
        
        for c in strings[index] {
            letterCombinations((index+1), strings, (carry + String(c)), &combinations)
        }
    }
    
}

print(Solution().letterCombinations("23"))

print(Solution().letterCombinations(""))

print(Solution().letterCombinations("2"))

print(Solution().letterCombinations("7"))

print(Solution().letterCombinations("234"))
