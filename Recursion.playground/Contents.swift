import Foundation

func factorial(_ number: Int) -> Int {
    
    if number == 0 {
        return 1
    }
    
    return number * factorial(number - 1)
    
}

let result = factorial(5)
print(result)
