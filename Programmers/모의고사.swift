import Foundation

func solution(_ answers:[Int]) -> [Int] {
    // 결과 딕셔너리 리스트
    var scores = [1:0, 2:0, 3:0]
    
    // 찍는 방식 딕셔너리 리스트
    let students = [
        1: [1, 2, 3, 4, 5],
        2: [2, 1, 2, 3, 2, 4, 2, 5],
        3: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    
    let firstCount = students[1]!.count
    let secondCount = students[2]!.count
    let thirdCount = students[3]!.count
    
    for (i, val) in answers.enumerated() {
        if (val == students[1]![i % firstCount]) {
            scores[1]! += 1
        }
        
        if (val == students[2]![i % secondCount]) {
            scores[2]! += 1
        }
        
        if (val == students[3]![i % thirdCount]) {
            scores[3]! += 1
        }
    }
    
    return scores
        .sorted{ $0.key < $1.key }
        .filter{ $0.value == scores.values.max() }
        .map { $0.key }
}
