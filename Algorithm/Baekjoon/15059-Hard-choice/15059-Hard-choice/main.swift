struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let flightServices = readIntegers()
        let passengers = readIntegers()
        
        var amount = 0
        
        for index in 0..<passengers.count {
            if passengers[index] > flightServices[index] {
                amount += passengers[index] - flightServices[index]
            }
        }
        
        print(amount)
    }
}

Solution().solution()
