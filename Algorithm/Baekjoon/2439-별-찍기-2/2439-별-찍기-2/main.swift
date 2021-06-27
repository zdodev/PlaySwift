struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        for i in 1...input {
            for j in 1...input {
                if j > input - i {
                    print("*", terminator: "")
                } else {
                    print(" ", terminator: "")
                }
                
            }
            print("")
        }
    }
}

Solution().solution()
