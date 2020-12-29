import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        var answer = 0
        var temp = 0
        let symbols = Array(s).map { Symbol(rawValue: $0) }
        
        if !symbols.isEmpty {
            
            for i in 0..<symbols.count {
                
                guard let symbol = symbols[i] else { preconditionFailure("Invalid Symbol") }
                
                if symbols.count - 1 > i {
                    guard let nextValue = symbols[i + 1]?.value else { preconditionFailure("Symbol not Existing") }
                    
                    var isTemp = false
                    
                    switch symbol {
                    case .i:
                        isTemp = nextValue == 5 || nextValue == 10
                    case .x:
                        isTemp = nextValue == 50 || nextValue == 100
                    case .c:
                        isTemp = nextValue == 500 || nextValue == 1000
                    default:
                        answer += symbol.value
                        continue
                    }
                    
                    if isTemp {
                        temp += symbol.value
                        continue
                    }
                    
                    answer += symbol.value
                    answer -= temp
                    temp = 0
                    
                } else {
                    
                    answer += symbol.value
                    answer -= temp
                }
            }
        }
        
        return answer
    }
    
    
}

// MARK: - SYMBOL

extension Solution {
    
    enum Symbol: Character {
        case i = "I"
        case v = "V"
        case x = "X"
        case l = "L"
        case c = "C"
        case d = "D"
        case m = "M"
    }
    
}

// MARK: - SYMBOL VALUE

extension Solution.Symbol {
    
    var value: Int {
        switch self {
        case .i:
            return 1
        case .v:
            return 5
        case .x:
            return 10
        case .l:
            return 50
        case .c:
            return 100
        case .d:
            return 500
        case .m:
            return 1000
        }
    }
    
}

let solution = Solution()

print(solution.romanToInt("III")) // ==> 3
print(solution.romanToInt("IV")) // ==> 4
print(solution.romanToInt("IX")) // ==> 9
print(solution.romanToInt("LVIII")) // ==> 58
print(solution.romanToInt("MCMXCIV")) // ==> 1994
