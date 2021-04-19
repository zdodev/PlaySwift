struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        var output = 0
        var newValue = input
        
        while newValue > 0 {
            if newValue % 5 == 0 {
                output += 1
                newValue -= 5
            } else if newValue % 3 == 0 {
                output += 1
                newValue -= 3
            } else if newValue > 5 {
                output += 1
                newValue -= 5
            } else {
                output = -1
                break
            }
        }
        
        print(output)
    }
}

Solution().solution()
