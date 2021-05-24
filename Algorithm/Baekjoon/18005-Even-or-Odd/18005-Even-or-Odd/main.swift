struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        if input % 2 == 1 {
            print(0)
            return
        }
        
        if (input / 2) % 2 == 1 {
            print(1)
        } else {
            print(2)
        }
    }
}

Solution().solution()
