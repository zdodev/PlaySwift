struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let p = readInteger()
        let q = readInteger()
        
        if q >= 30 {
            print("Red")
        } else if p <= 50 && q <= 10 {
            print("White")
        } else {
            print("Yellow")
        }
    }
}

Solution().solution()
