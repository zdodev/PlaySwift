struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        if (90...100).contains(input) {
            print("A")
        } else if (80...89).contains(input) {
            print("B")
        } else if (70...79).contains(input) {
            print("C")
        } else if (60...69).contains(input) {
            print("D")
        } else {
            print("F")
        }
    }
}

Solution().solution()
