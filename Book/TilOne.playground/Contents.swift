import Foundation

/*
 Until 1
 subtract
 or
 devide
 
 how many times
 */

func solution(_ n: Int, _ k: Int) -> Int {
    
    var copy = n
    var count = 0
    
    while copy != 1 {
        
        if copy % k == 0 {
            copy /= k
        } else {
            copy -= 1
        }
        
        count += 1
        
    }
    
    while copy > 1 {
        copy -= 1
        count += 1
    }
    
    return count
}

print(solution(17, 4)) // => 3
print(solution(25, 5)) // => 2
