struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let a = input[1]
        let b = input[0] - a
        let c = input[2]
        let d = input[0] - c
        
        let pieceArray = [
            a * c, a * d,
            b * c, b * d,
        ]
        
        print(pieceArray.max()! * 4)
    }
}

Solution().solution()
