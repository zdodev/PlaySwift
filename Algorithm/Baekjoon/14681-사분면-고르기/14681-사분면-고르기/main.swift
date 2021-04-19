struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let x = readInteger()
        let y = readInteger()
        var output = 0
        
        if x > 0 {
            if y > 0 {
                output = 1
            } else {
                output = 4
            }
        } else {
            if y > 0 {
                output = 2
            } else {
                output = 3
            }
        }
        
        print(output)
    }
}

Solution().solution()
