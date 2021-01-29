import Foundation

func solution(_ n: Int, _ movements: String) -> (x: Int, y: Int) {
    let mappedMovements = movements.replacingOccurrences(of: " ", with: "")
    
    var answer = (x: 1, y: 1)
    
    for movement in mappedMovements {
        if movement == "L" {
            if answer.y > 1 {
                answer.y -= 1
            }
            continue
        }
        
        if movement == "R" {
            if answer.y < 5 {
                answer.y += 1
            }
            continue
        }
        
        if movement == "U" {
            if answer.x > 1 {
                answer.x -= 1
            }
            continue
        }
        
        if movement == "D" {
            if answer.x < 5 {
                answer.x += 1
            }
            continue
        }
    }
    
    return answer
}

print(solution(5, "R R R U D D")) // => (x: 3, y: 4)
