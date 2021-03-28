//import Foundation
//
//func solution(_ numbers:[Int]) {
////    let answer = numbers.combSort().map { String($0) }.joined()
//    let answer = numbers.combSort().combSort().customSort()
//    print(answer)
////    return answer.first == "0" ? "0" : answer
//}
//
//extension Array where Self.Element == Int {
//
//    func combSort() -> Self {
//        var copy = self
//
//        var gap = copy.count
//        let shrink = 1.3
//
//        while gap > 1 {
//            gap = Int(Double(gap) / shrink)
//
//            if gap < 1 {
//                gap = 1
//            }
//
//            var index = 0
//
//            while !(index + gap >= self.count) {
//                if copy[index] > copy[index + gap] {
//                    copy.swapAt(index, index + gap)
//                }
//                index += 1
//            }
//        }
//
//        print(copy)
//        return copy
//    }
//
//    func customSort() -> String {
//        var temp = [String]()
//
//        for chunked in self.chunked(into: 2) {
//            let max = chunked.max()!
//            let min = chunked.min()!
//            temp.append("\(max)\(min)")
//        }
//
//        return temp.joined()
//    }
//
//}
//
//extension Array {
//    func chunked(into size: Int) -> [[Element]] {
//        return stride(from: 0, to: count, by: size).map {
//            Array(self[$0..<Swift.min($0 + size, count)])
//        }
//    }
//}
//


import Foundation

func solution(_ numbers:[Int]) -> String {
    // let answer: String = numbers.map{String($0)}.sorted { $0 + $1 > $1 + $0 }.joined()
    let answer = numbers.customCombSort().map { String($0) }.joined()
    return answer.first == "0" ? "0" : answer
}

// 이상한 짓을 해볼까아아아

extension Array where Self.Element == Int {
    
    func customCombSort() -> Self {
        var copy = self
        
        var gap = copy.count
        let shrink = 1.3
        
        while gap > 1 {
            gap = Int(Double(gap) / shrink)
            
            if gap < 1 {
                gap = 1
            }
            
            var index = 0
            
            while !(index + gap >= self.count) {
                if Int("\(self[index])\(copy[index + gap])")! > Int("\(copy[index + gap])\(self[index])")! {
                    copy.swapAt(index, index + gap)
                }
                index += 1
            }
        }
        
        copy.reverse()
        
        return copy
    }
    
}

print(solution([6, 10, 2]))
print(solution([3, 30, 34, 5, 9]))
print(solution([303, 300, 34, 5, 9, 600, 500, 800, 900, 111, 222, 667, 445]))
