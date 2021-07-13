struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let n = readInteger()
        let max = 2 * n - 1
        
        var leftIndex = 1
        var rightIndex = max
        
        for index1 in 1...max {
            for index2 in 1...rightIndex {
                if index2 < leftIndex || index2 > rightIndex {
                    print(" ", terminator: "")
                } else {
                    print("*", terminator: "")
                }
            }
            print("")
            if index1 < n {
                leftIndex += 1
                rightIndex -= 1
            } else {
                leftIndex -= 1
                rightIndex += 1
            }
        }
    }
}

Solution().solution()
