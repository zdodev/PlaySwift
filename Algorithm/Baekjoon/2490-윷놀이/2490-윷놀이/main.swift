struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func rolling(_ yut: [Int]) -> String {
        var zero = 0
        
        yut.forEach { element in
            if element == 0 {
                zero += 1
            }
        }
        
        var one = 0
        
        yut.forEach { element in
            if element == 1 {
                one += 1
            }
        }
        
        if zero == 1 {
            return "A"
        } else if zero == 2 {
            return "B"
        } else if zero == 3 {
            return "C"
        } else if zero == 4 {
            return "D"
        }
        
        return "E"
    }
    
    func solution() {
        for _ in 1...3 {
            let input = readIntegers()
            let result = rolling(input)
            print(result)
        }
    }
}

Solution().solution()
