struct Solution {
    private func readDouble() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let input = readDouble()
        let commition = input * 0.01 + 25
        
        if commition < 100 {
            print(100.00)
        } else if commition > 2000 {
            print(2000.00)
        } else {
            print(commition)
        }
    }
}

Solution().solution()
