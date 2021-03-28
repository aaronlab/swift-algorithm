import Foundation

func reverseNumber(_ x: Int) -> Int {
    var num = x, reversed = 0
    
    while num != 0 {
        reversed = (reversed * 10) + (num % 10)
        num /= 10
    }
    
    return reversed
}

print(reverseNumber(100)) // 1
print(reverseNumber(101)) // 101
print(reverseNumber(123)) // 321
print(reverseNumber(321)) // 123
