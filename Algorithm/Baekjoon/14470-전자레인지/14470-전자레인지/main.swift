struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let A = readInteger()
        let B = readInteger()
        let C = readInteger()
        let D = readInteger()
        let E = readInteger()
        
        var totalTime = 0
        
        if A < 0 {
            totalTime = -A * C
            totalTime += D
            totalTime += B * E
        } else {
            totalTime = (B - A) * E
        }
        
        print(totalTime)
    }
}

Solution().solution()
