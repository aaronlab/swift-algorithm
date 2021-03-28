import Foundation

let firstArray = ["A", "B", "C"]

let secondArray = ["B", "C", "A"]

let thirdArray = ["A", "D"]

// I want to check if the "secondArray" and "thirdArray" has all elements of "firstArray"

print(firstArray == secondArray) // AS IS: FALSE ---> TO BE: TRUE
print(firstArray == thirdArray)  // AS IS: FALSE ---> TO BE: FALSE
print(secondArray == thirdArray) // AS IS: FALSE ---> TO BE: FALSE
print()

print("Solution 1: Conversion to Set")
print(Set(firstArray) == Set(secondArray)) // TRUE
print(Set(firstArray) == Set(thirdArray)) // FALSE
print(Set(secondArray) == Set(thirdArray)) // FALSE
print()

print("Solution 2: Using 'allSatisfy + contains'")
print(secondArray.allSatisfy(firstArray.contains))  // TRUE
print(secondArray.allSatisfy(thirdArray.contains))  // FALSE
print(thirdArray.allSatisfy(firstArray.contains))  // FALSE
print(thirdArray.allSatisfy(secondArray.contains))  // FALSE


