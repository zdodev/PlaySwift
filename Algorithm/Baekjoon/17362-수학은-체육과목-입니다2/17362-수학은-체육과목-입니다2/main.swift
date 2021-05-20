struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let remainder = input % 8
        
        if remainder == 0 {
            print(2)
        } else if remainder >= 1 && remainder <= 5 {
            print(remainder)
        } else if remainder == 6 {
            print(4)
        } else if remainder == 7 {
            print(3)
        }
    }
}

Solution().solution()
