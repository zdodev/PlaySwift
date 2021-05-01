struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let difference = input[1] - input[0]
        var count = 1
        var interval = difference
        while interval < input[1] {
            interval += difference
            count += 1
        }
        
        print(count)
    }
}

Solution().solution()
