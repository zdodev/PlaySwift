struct Solution {
    private func readInteger() -> String {
        readLine()!
    }
    
    private func getFirstDigit(_ number: String) -> (String, Int) {
//        while number != 0 {
//            result = number % 10
//            count += 1
//            number /= 10
//        }
        let result = String(number.first!)
        let count = number.count
        
        return (result, count)
    }
    
    func solution() {
        let input = readInteger()
        
        var firstNumber = getFirstDigit(input)
        var secondNumber = Int(firstNumber.0)! * firstNumber.1
        
        while Int(firstNumber.0) != secondNumber {
            firstNumber = getFirstDigit(String(secondNumber))
            secondNumber = Int(firstNumber.0)! * firstNumber.1
        }
        
        print("FA")
    }
}

Solution().solution()
