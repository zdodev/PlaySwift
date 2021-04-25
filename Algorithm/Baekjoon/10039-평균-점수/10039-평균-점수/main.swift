struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var sum = 0
        
        for _ in 1...5 {
            var score = readInteger()
            if score < 40 {
                score = 40
            }
            sum += score
        }
        
        let average = sum / 5
        print(average)
    }
}

Solution().solution()
