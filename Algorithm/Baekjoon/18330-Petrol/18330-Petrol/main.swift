struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let usage = readInteger()
        let remains = readInteger()
        
        if usage <= remains + 60 {
            print(usage * 1500)
        } else {
            let remainAmount = remains + 60
            let excessAmount = usage - remains - 60
            
            let remainPrice = remainAmount * 1500
            let excessPrice = excessAmount * 3000
            
            print(remainPrice + excessPrice)
        }
    }
}

Solution().solution()
