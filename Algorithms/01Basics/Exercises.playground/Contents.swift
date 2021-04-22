import Foundation

func q13(_ x: Int, _ y: Int, _ z: Int) -> String {
    if (x, y) == (y, z) {
        return "equal"
    }
    return "not equal"
}

print(q13(1, 1, 1))
print(q13(1, 2, 1))

func q15(x: Double, y: Double) -> Bool {
    if x >= 0 && x <= 1 && y >= 0 && y <= 1 {
        return true
    }
    return false
}

print(q15(x: 1.1, y: 0.1))
print(q15(x: 0.1, y: 0.9))

var f = 0
var g = 0
for _ in 0...15 {
    f += g
    g = f - g
}

var t = 9.0
while abs(t - 9.0 / t) > 0.001 {
    t = (9.0/t + t) / 2.0
}
print(t)
