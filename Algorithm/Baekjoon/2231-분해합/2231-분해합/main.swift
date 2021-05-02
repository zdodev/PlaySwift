struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func calculateSeparateSum(_ number: String) -> Int {
        let original = Int(number)!
        let sumOfSeparateNumber = number.reduce(0) { result, element in
            result + Int(String(element))!
        }
        
        return original + sumOfSeparateNumber
    }
    
    func solution() {
        let input = readLine()!
        let integerInput = Int(input)!
        
        for number in 1..<integerInput {
            let sepateSum = calculateSeparateSum(String(number))
            if sepateSum == integerInput {
                print(number)
                return
            }
        }
        
        print(0)
    }
}

Solution().solution()
