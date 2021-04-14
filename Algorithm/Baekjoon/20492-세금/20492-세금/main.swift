struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        var output = [Int]()
        output.append(Int(Double(input) * 0.78))
        output.append(Int(Double(input) * 0.956))
        print("\(output[0]) \(output[1])")
    }
}

Solution().solution()
