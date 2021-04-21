struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func completeData(_ amount: Int, _ perDay: Int) -> Int {
        if amount % perDay == 0 {
            return amount / perDay
        } else {
            return amount / perDay + 1
        }
    }
    
    func solution() {
        let L = readInteger()
        let A = readInteger()
        let B = readInteger()
        let C = readInteger()
        let D = readInteger()
        
        let languageDate = completeData(A, C)
        let mathDate = completeData(B, D)
        
        let maxDate = [languageDate, mathDate].max()!
        let output = L - maxDate
        print(output)
    }
}

Solution().solution()
