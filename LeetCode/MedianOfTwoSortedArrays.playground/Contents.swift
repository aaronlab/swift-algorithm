import Foundation

class Solution {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        var newArray = nums1 + nums2
//        newArray.sort()
//
//        if newArray.count == 1 {
//
//            return Double(newArray[0])
//        }
//
//        let medianIndex = newArray.count / 2
//
//        if newArray.count % 2 != 0 { // ODD COUNT
//            return Double(newArray[medianIndex])
//        } else { // EVEN COUNT
//            let firstMedian = Double(newArray[medianIndex - 1])
//            let lastMedian = Double(newArray[medianIndex])
//
//            return (firstMedian + lastMedian) / 2
//        }
//    }
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count <= nums2.count  else {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let m = nums1.count, n = nums2.count
        var start = 0, end = m
        
        while start <= end {
            let cutPos1 = (start + end)/2
            let cutPos2 = (m + n + 1)/2 - cutPos1
            
            let maxLeft1 = cutPos1 == 0 ? Int.min : nums1[cutPos1-1]
            let minRight1 = cutPos1 == m ? Int.max : nums1[cutPos1]
            
            let maxLeft2 = cutPos2 == 0 ? Int.min : nums2[cutPos2-1]
            let minRight2 = cutPos2 == n ? Int.max : nums2[cutPos2]
            
            if maxLeft1 <= minRight2, maxLeft2 <= minRight1 {
                if (m + n) % 2 == 0 {
                    return Double(max(maxLeft1, maxLeft2) + min(minRight1, minRight2))/2.0
                } else {
                    return Double(max(maxLeft1, maxLeft2))
                }
            } else if maxLeft1 > minRight2 {
                end = cutPos1 - 1
            } else {
                start = cutPos1 + 1
            }
        }
        return -1
    }
}

print(Solution().findMedianSortedArrays([1, 3], [2])) // 2.00000
print(Solution().findMedianSortedArrays([1, 2], [3, 4])) // 2,50000
print(Solution().findMedianSortedArrays([0, 0], [0, 0])) // 0.00000
print(Solution().findMedianSortedArrays([], [1])) // 1.0
print(Solution().findMedianSortedArrays([2], [])) // 2.00000
