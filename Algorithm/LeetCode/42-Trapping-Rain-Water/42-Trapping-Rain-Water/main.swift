class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }
        
        var volumn = 0
        var left = 0
        var right = height.count - 1
        var leftMax = height[left]
        var rightMax = height[right]
        
        while left < right {
            leftMax = max(height[left], leftMax)
            rightMax = max(height[right], rightMax)
            
            if leftMax <= rightMax {
                volumn += leftMax - height[left]
                left += 1
            } else {
                volumn += rightMax - height[right]
                right -= 1
            }
        }
        return volumn
    }
}
