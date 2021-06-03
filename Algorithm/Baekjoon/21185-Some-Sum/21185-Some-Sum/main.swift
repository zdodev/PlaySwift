struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        if input % 2 == 1 {
            print("Either")
        } else if (input / 2) % 2 == 0 {
            print("Even")
        } else {
            print("Odd")
        }
    }
}

Solution().solution()
