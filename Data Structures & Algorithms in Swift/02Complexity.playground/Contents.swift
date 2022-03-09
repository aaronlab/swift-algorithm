/*
 Complexity
 */

import Foundation

typealias Names = [String]

/// O(1)
func constantTime(names: Names) {
  guard let first = names.first else {
    print("no names")
    return
  }
  
  print(first)
}

/// O(n)
func linearTime(names: Names) {
  for name in names {
    print(name)
  }
}

/// O(n^2)
func quadraticTime(names: Names) {
  for _ in names {
    for name in names {
      print(name)
    }
  }
}

typealias Numbers = [Int]

/// Worst: O(n)
///
/// With a sorted array
func logarithmicTime1(_ value: Int, in array: Numbers) -> Bool {
  for element in array {
    if element == value {
      return true
    }
  }
  
  return false
}

/// With a sorted array
///
/// Only checks half of the array.
///
/// O(log n)
func logarithmicTime2(_ value: Int, in array: Numbers) -> Bool {
  guard !array.isEmpty else { return false }
  
  let middleIndex = array.count / 2
  
  if value <= array[middleIndex] {
    
    for index in 0 ... middleIndex {
      if array[index] == value {
        return true
      }
    }
    
  } else {
    
    for index in middleIndex ..< array.count {
      if array[index] == value {
        return true
      }
    }
    
  }
  
  return false
}

/**
 # Quasilinear time
 
 - Worse than `linear` time, but dramatically better than `quadratic` time.
 
 - Between logarithmic & linear time.
 
 - e.g. `sort` in Swift
 
 - O(n log n)
 */


/*
 Comparing
 */

/// O(n)
func sumFromOne(upto n: Int) -> Int {
//  var result: Int = .zero
//  for i in 1 ... n {
//    result += i
//  }
//  return result
  
  // Compiled code
//  return (1 ... n).reduce(.zero, +)
  
  // By Gauss: O(1)
  return (n + 1) * n / 2
}

sumFromOne(upto: 10000)

/*
 Space complexity
 */

func printSorted(_ array: Numbers) {
  // Space: O(n)
//  let sorted = array.sorted()
//  for element in sorted {
//    print(element)
//  }
  
  // Space: O(1) -> Only a few variables
  
  // 1
  // Nothing to print
  guard !array.isEmpty else { return }
  
  // 2
  var currentCount = 0 // The number of print statements
  var minValue = Int.min // The last printed value
  
  // 3
  for value in array {
    if value == minValue {
      
      currentCount += 1
      print(value)
    }
  }
  
  while currentCount < array.count {
    var currentValue = array.max()!
    
    // 4
    for value in array {
      if value < currentValue && value > minValue {
        currentValue = value
      }
    }
    
    // 5
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }
    
    // 6
    minValue = currentValue
  }
}


/**
 # Key Points
 
 - `Time complexity` is a mesure on the time required to run an algorithm as the input size increases.
 
 - Constant time, logarithmic time, linear time, quasilinear time, quadratic time
 
 - `Space complexity` is a meaure of the resources required for the algorithm to run.
 
 - `Big O` notation is used to represent the general form of time and space complexity.
 
 - Time and space complexity are high-level measures of scalability.
 
 - For small data sets, time plexity is usually irrelevant.
  - e.g. A quasilinear algorithm can be slower than a quadratic algorithms when *n* is small.
 */
