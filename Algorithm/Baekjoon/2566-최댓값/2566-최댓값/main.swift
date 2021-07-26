struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        var maxNumber = Int.min
        var row = 0
        var column = 0
        
        var matrix = [[Int]]()
        
        for _ in 1...9 {
            matrix.append(readIntegers())
        }
        
        for index1 in 0...8 {
            for index2 in 0...8 {
                if matrix[index1][index2] > maxNumber {
                    maxNumber = matrix[index1][index2]
                    row = index1 + 1
                    column = index2 + 1
                }
            }
        }
        
        print(maxNumber)
        print("\(row) \(column)")
    }
}

Solution().solution()
