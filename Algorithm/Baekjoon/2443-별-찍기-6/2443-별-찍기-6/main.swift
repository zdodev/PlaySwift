struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        for index1 in 1...input {
            for index2 in 1...input * 2 - index1 {
                if index2 < index1 || index2 > input * 2 - index1 {
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
