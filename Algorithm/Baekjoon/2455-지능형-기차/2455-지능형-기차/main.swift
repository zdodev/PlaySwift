struct Solution {
    var currentPassenger = 0
    
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    mutating func station(_ passengers: [Int]) {
        currentPassenger +=  passengers[1] - passengers[0]
    }
    
    
    mutating func solution() {
        var max = Int.min
        
        for _ in 1...4 {
            let input = readIntegers()
            station(input)
            if currentPassenger > max {
                max = currentPassenger
            }
        }
        
        print(max)
    }
}

var solution = Solution()
solution.solution()
