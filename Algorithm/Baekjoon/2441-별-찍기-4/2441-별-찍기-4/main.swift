struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        for index1 in 0..<input {
            for index2 in 0..<input {
                if index2 < index1 {
                    print(" ", terminator: "")
                } else {
                    print("*", terminator: "")
                }
            }
            print("")
        }
    }
}

Solution().solution()
