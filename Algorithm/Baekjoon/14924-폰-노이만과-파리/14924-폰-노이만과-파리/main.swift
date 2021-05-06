struct Solution {
    private func readInteger() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readInteger()
        let A = input[0]
        let B = input[1]
        let C = input[2]
        
        let movingTime = C / (2 * A)
        print(movingTime * B)
    }
}

Solution().solution()
