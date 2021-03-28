import Foundation

func solution(_ location: String) -> Int {
    let splitedLocation = location.map({ String($0) })
    
    let a = Int("a".unicodeScalars.first!.value)
    let x = Int(splitedLocation[0].unicodeScalars.first?.value ?? 0) - a + 1
    
    if x == 0 { return 0 }
    
    guard let y = Int(splitedLocation[1]) else {
        fatalError("Invalid location")
    }
    
    let availableDirections = [
        (x: 2, y: 1),
        (x: 2, y: -1),
        (x: -2, y: 1),
        (x: -2, y: -1),
        (x: 1, y: 2),
        (x: 1, y: -2),
        (x: -1, y: 2),
        (x: -1, y: -2)
    ]
    
    var answer = 0
    
    for direction in availableDirections {
        
        let newX = x + direction.x
        let newY = y + direction.y
        
        if newX >= 1 && newX <= 7 && newY >= 1 && newY <= 7 {
            answer += 1
        }
        
    }
    
    return answer
}

print(solution("a1")) // 2
