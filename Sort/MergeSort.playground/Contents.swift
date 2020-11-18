import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var answer = Array<Int>()
    
    for command in commands {
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        
        let splited = Array(array[i...j])
        let sorted = mergeSort(with: splited)
        
        answer.append(sorted[k])
    }
    
    return answer
}

func mergeSort(with list: [Int]) -> [Int] {
    
    if list.count <= 1 {
        return list
    }
    
    var leftList = [Int]()
    var rightList = [Int]()
    
    let middle = list.count / 2
    leftList += list[0..<middle]
    rightList += list[middle..<list.count]
    
    let left = mergeSort(with: leftList)
    let right = mergeSort(with: rightList)
    
    return merge(left, right)
}


func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = [Int]()
    
    var left = left
    var right = right
    
    while !left.isEmpty && !right.isEmpty {
        result += [left[0] < right[0] ? left.remove(at: 0) : right.remove(at: 0)]
    }
    if !left.isEmpty {
        result += left
    }
    if !right.isEmpty {
        result += right
    }
    
    return result
}


print(mergeSort(with: [1, 5, 2, 6, 3, 7, 4]))
print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))

