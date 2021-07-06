struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        for element in 1...input {
            for _ in 1...input - element + 1 {
                print("*", terminator: "")
            }
            print("")
        }
    }
}

Solution().solution()
