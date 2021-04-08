struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func sum(_ n: Int) -> Int {
        (1...n).reduce(0) { (result, element) in
            result + element
        }
    }
    
    func solution() {
        let input = readInteger()
        let output = sum(input)
        print(output)
    }
}

Solution().solution()
