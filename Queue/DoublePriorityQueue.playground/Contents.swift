import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var temp = [Int]()  // TEMP STORAGE
    
    for operation in operations {
        
        if operation.contains("I") {
            // INSERT
            let values = operation.split(separator: " ")
            guard let value = Int(values[1]) else { continue }
            
            temp.append(value)
        } else {
            switch operation {
            
            // DELETE MAX
            case Operator.deleteMax.rawValue:
                temp = temp.filter { $0 != temp.max() }
                
            // DELETE MIN
            case Operator.deleteMinimum.rawValue:
                temp = temp.filter { $0 != temp.min() }
                
            // UNKNOWN
            default:
                break
            }
        }
    }
    
    // isEmpty ? [0, 0] : [max, min]
    return [temp.max() ?? 0, temp.min() ?? 0]
}

/// Definition of Delete Operators
enum Operator: String {
    case deleteMax = "D 1"
    case deleteMinimum = "D -1"
}

print(solution(["I 16", "D 1"])) // ---> [0, 0]
print(solution(["I 7", "I 5", "I -5", "D -1"])) // ---> [7, 5]
print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])) // ---> [333, -45]
