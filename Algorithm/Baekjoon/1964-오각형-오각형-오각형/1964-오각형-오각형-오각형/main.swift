struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        var sum = 5
        
        if input == 1 {
            print(sum)
            return
        }
        
        for count in 2...input {
            sum += (count + 1) * 3 - 2
        }
        
        print(sum % 45678)
    }
}

Solution().solution()
