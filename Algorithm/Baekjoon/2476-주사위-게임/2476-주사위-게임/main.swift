struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func rolling(_ dices: [Int]) -> Int {
        if dices[0] == dices[1] && dices[1] == dices[2] {
            return 10_000 + dices[0] * 1_000
        } else if dices[0] == dices[1] {
            return 1_000 + dices[0] * 100
        } else if dices[1] == dices[2] {
            return 1_000 + dices[1] * 100
        } else if dices[0] == dices[2] {
            return 1_000 + dices[0] * 100
        } else {
            return dices.max()! * 100
        }
    }
    
    func solution() {
        let input = readInteger()
        
        var maximumCashPrize = Int.min
        
        for _ in 1...input {
            let dice = readIntegers()
            let cashPrice = rolling(dice)
            if cashPrice > maximumCashPrize {
                maximumCashPrize = cashPrice
            }
        }
        
        print(maximumCashPrize)
    }
}

Solution().solution()
