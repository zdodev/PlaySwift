struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let n = readInteger()
        var i = n
        
        for index1 in 1...n * 2 - 1 {
            for index2 in 1...n {
                if index2 >= i {
                    print("*", terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
            print("")
            
            if index1 < n {
                i -= 1
            } else {
                i += 1
            }
        }
    }
}

Solution().solution()
