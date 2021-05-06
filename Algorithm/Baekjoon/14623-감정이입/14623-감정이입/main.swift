struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readString() -> String {
        readLine()!
    }
    
    func solution() {
        let input1 = Int(readString(), radix: 2)!
        let input2 = Int(readString(), radix: 2)!
        let multiplication = input1 * input2
        let binary = String(multiplication, radix: 2)
        print(binary)
    }
}

Solution().solution()
