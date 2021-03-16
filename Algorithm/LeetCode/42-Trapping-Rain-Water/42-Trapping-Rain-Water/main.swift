struct Trap {
    func method1(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }
        
        var rainVolumn = 0
        var leftPointer = 0
        var rightPointer = height.count - 1
        var leftMaxHeight = height[leftPointer]
        var rightMaxHeight = height[rightPointer]
        
        while leftPointer < rightPointer {
            print("before: \(leftPointer), \(rightPointer)")
            leftMaxHeight = max(height[leftPointer], leftMaxHeight)
            rightMaxHeight = max(height[rightPointer], rightMaxHeight)
            
            if leftMaxHeight <= rightMaxHeight {
                rainVolumn += leftMaxHeight - height[leftPointer]
                leftPointer += 1
            } else {
                rainVolumn += rightMaxHeight - height[rightPointer]
                rightPointer -= 1
            }
            print("after: \(leftPointer), \(rightPointer)")
        }
        return rainVolumn
    }
}

class Solution {
    let trapSolution = Trap()
    
    func trap(_ height: [Int]) -> Int {
        trapSolution.method1(height)
    }
}
