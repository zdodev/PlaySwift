struct Solution {
    private func readInteger() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readInteger()
        let (n, a, b, c, d) = (input[0], input[1], input[2], input[3], input[4])
        
        var setAResult = 0
        
        if n % a == 0 {
            setAResult = n / a * b
        } else {
            setAResult = (n / a + 1) * b
        }
        
        var setBResult = 0
        
        if n % c == 0 {
            setBResult = n / c * d
        } else {
            setBResult = (n / c + 1) * d
        }
        
        if setAResult < setBResult {
            print(setAResult)
        } else {
            print(setBResult)
        }
    }
}

Solution().solution()
