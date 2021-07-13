struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let n = readInteger()
        let max = 2 * n - 1
        let max2 = 2 * n
        
        var leftIndex = 1
        var rightIndex = max2
        
        for index1 in 1...max {
            for index2 in 1...max2 {
                if index2 <= leftIndex || index2 >= rightIndex {
                    print("*", terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
            if index1 >= n {
                leftIndex -= 1
                rightIndex += 1
            } else {
                leftIndex += 1
                rightIndex -= 1
            }
            print("")
        }
    }
}

Solution().solution()
