struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let a = readInteger()
        let x = readInteger()
        let b = readInteger()
        let y = readInteger()
        let t = readInteger()
        
        var aTime = t - 30
        var bTime = t - 45
        
        if aTime < 0 {
            aTime = 0
        }
        if bTime < 0 {
            bTime = 0
        }
        
        let result1 = a + aTime * x * 21
        let result2 = b + bTime * y * 21
        
        print("\(result1) \(result2)")
    }
}

Solution().solution()
