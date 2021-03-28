//
//  main.swift
//  TargetNumber
//
//  Created by Aaron Lee on 2021/01/19.
//
//

import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    var answer = 0
    myDFS(index: 0, sum: 0, target: target, numbers: numbers, answer: &answer)

    return answer
}

func myDFS(index: Int, sum: Int, target: Int, numbers: [Int], answer: inout Int) {
    if index == numbers.count {
        if sum == target {
            answer += 1
        }
        return
    }

    myDFS(index: index + 1, sum: sum + numbers[index], target: target, numbers: numbers, answer: &answer)
    myDFS(index: index + 1, sum: sum - numbers[index], target: target, numbers: numbers, answer: &answer)
}

print(solution([1, 1, 1, 1, 1], 3)) // ==> 5
