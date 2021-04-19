import Foundation

func factorial(_ number: Int) -> Int {
    
    if number == 0 {
        return 1
    }
    
    return number * factorial(number - 1)
    
}

let result = factorial(5)
print(result)

func power(_ number: Int, pow: Int) -> Int {
    
    if pow == 0 {
        return 1
    } else {
        return number * power(number, pow: pow - 1)
    }
    
}

print(power(2, pow: 3))
