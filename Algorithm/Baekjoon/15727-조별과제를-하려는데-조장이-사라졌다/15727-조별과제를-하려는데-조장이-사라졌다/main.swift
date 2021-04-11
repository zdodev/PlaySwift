struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func minimumTime(_ distance: Int) -> Int {
        var minute = distance / 5
        let remainder = distance % 5
        if remainder > 0 {
            minute += 1
        }
        return minute
    }
    
    func solution() {
        let input = readInteger()
        let output = minimumTime(input)
        print(output)
    }
}

Solution().solution()

