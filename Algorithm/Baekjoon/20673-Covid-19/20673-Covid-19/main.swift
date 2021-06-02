struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let p = readInteger()
        let q = readInteger()
        
        if q >= 30 {
            print("Red")
        } else if q >= 11 {
            print("Yellow")
        } else {
            print("White")
        }
    }
}

Solution().solution()
