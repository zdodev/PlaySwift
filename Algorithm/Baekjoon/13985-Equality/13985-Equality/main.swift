struct Solution {
    private func readMathExpression() -> [String] {
        readLine()!.split(separator: " ").map {
            String($0)
        }
    }
    
    func solution() {
        let mathExpression = readMathExpression()
        let firstOperand = Int(mathExpression[0])!
        let secondOperand = Int(mathExpression[2])!
        let result = Int(mathExpression[4])!
        
        if firstOperand + secondOperand == result {
            print("YES")
        } else {
            print("NO")
        }
    }
}

Solution().solution()
