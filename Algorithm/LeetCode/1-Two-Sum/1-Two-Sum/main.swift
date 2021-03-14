import Foundation

struct TwoSum {
    // Brute Force 탐색
    func searchBruteForce(_ nums: [Int], _ target: Int) -> [Int] {
        for outerIndex in 0..<nums.count - 1 {
            for innerIndex in outerIndex + 1..<nums.count {
                if nums[outerIndex] + nums[innerIndex] == target {
                    return [outerIndex, innerIndex]
                }
            }
        }
        
        return [0, 0]
    }
    
    // 나머지 값 탐색
    func searchRest(_ nums: [Int], _ target: Int) -> [Int] {
        for (index, firstValue) in nums.enumerated() {
            let rest = target - firstValue
            
            if let lastIndex = nums[(index + 1)...].firstIndex(of: rest) {
                return [index, lastIndex]
            }
        }
        
        return [0, 0]
    }
    
    // Dictionary 탐색
    func searchDictionary(_ nums: [Int], _ target: Int) -> [Int] {
        let dictionaryNums = nums.enumerated().reduce(into: [Int: Int]()) { (result, element) in
            result[element.1] = element.0
        }
        
        for (index, num) in nums.enumerated() {
            let rest = target - num
            if let value = dictionaryNums[rest], value != index {
                return [index, value]
            }
        }
        
        return [0, 0]
    }
}

class Solution {
    let twoSumSolution = TwoSum()
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        return twoSumSolution.searchBruteForce(nums, target)
//        return twoSumSolution.searchRest(nums, target)
        return twoSumSolution.searchDictionary(nums, target)
    }
}
