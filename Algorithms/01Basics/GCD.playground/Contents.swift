import Foundation

func gcd(p: Int, q: Int) -> Int {
    
    if q == 0 { return p }
    let r = p % q
    return gcd(p: q, q: r)
    
}

print(gcd(p: 123, q: 22))
