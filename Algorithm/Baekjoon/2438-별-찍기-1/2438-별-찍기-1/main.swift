struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        (1...input).forEach { index in
            (1...index).forEach { _ in
                print("*", terminator: "")
            }
            print("")
        }
    }
}

Solution().solution()
