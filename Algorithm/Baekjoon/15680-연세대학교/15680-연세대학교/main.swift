struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        if input == 0 {
            print("YONSEI")
        } else {
            print("Leading the Way to the Future")
        }
    }
}

Solution().solution()
