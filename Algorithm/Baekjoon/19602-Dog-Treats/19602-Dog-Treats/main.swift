struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let s = readInteger()
        let m = readInteger()
        let l = readInteger()
        
        let sum = s + 2 * m + 3 * l
        
        if sum >= 10 {
            print("happy")
        } else {
            print("sad")
        }
    }
}

Solution().solution()
