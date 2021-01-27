import Foundation

func numOfCoins(_ i: Int) -> Int {
    
    if i % 10 != 0 { fatalError("not allowed currency") }
    
    var answer = 0
    var copy = i
    let coins = [500, 100, 50, 10]
    
    for coin in coins {
        answer += copy / coin
        copy %= coin
    }
    
    return answer
}

print(numOfCoins(1260))

// 1000 200 60
// 500 500 100 100 50 10
