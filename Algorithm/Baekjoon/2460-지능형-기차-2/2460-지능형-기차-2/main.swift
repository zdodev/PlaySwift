struct Solution {
    var currentPassenger = 0
    var numberOfPeoplePerStation = [Int]()
    
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    mutating func station(_ passengers: [Int]) {
        currentPassenger += passengers[1] - passengers[0]
        
        numberOfPeoplePerStation.append(currentPassenger)
    }
    
    mutating func solution() {
        for _ in 1...10 {
            let input = readIntegers()
            station(input)
        }
        print(numberOfPeoplePerStation.max()!)
    }
}

var solution = Solution()
solution.solution()

