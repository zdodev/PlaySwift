struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let n = readInteger()
        
        var printIndex = 1
        
        for index1 in 1...n * 2 - 1 {
            for index2 in 1...n {
                if index2 <= printIndex {
                    print("*", terminator: "")
                } else {
                    break
                }
            }
            
            if index1 < n {
                printIndex += 1
            } else {
                printIndex -= 1
            }
            
            print("")
        }
    }
}

Solution().solution()
