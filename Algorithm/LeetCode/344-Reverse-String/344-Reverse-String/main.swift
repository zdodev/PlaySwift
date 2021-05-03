class Solution {
    private func twoPointers(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    private func swifty(_ s: inout [Character]) {
        s.reverse()
    }
    
    func reverseString(_ s: inout [Character]) {
//        twoPointers(&s)
        swifty(&s)
    }
}

struct TestCase {
    var all: [[Character]] = [
        ["h", "e", "l", "l", "o"],
        ["H", "a", "n", "n", "a", "h"],
    ]
    
    let result: [[Character]] = [
        ["o", "l", "l", "e", "h"],
        ["h", "a", "n", "n", "a", "H"],
    ]
}
