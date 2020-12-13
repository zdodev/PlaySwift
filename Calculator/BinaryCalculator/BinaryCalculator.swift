struct BinaryCalculator {
    func calculate(postfixTokenExpression: [BinaryToken]) -> BinaryToken? {
        var temporaryOperandStorage = Stack<BinaryToken>()

        for token in postfixTokenExpression {
            switch token {
            case let binaryOperandToken as BinaryOperand:
                temporaryOperandStorage.push(element: binaryOperandToken)
            case let operatorToken as BinaryOperator:
                var intermediateCalculationToken: BinaryToken?
                
                if operatorToken.value == .bitwiseNOT {
                    guard let firstToken = temporaryOperandStorage.pop() else { return nil }
                    guard let singleOperand = firstToken as? BinaryOperand else { return nil }
                    let newValue = checkBinaryMaxLength(value: BinaryCalculation.calculate(singleOperand.value, 0, .bitwiseNOT))
                    intermediateCalculationToken = BinaryOperand(value: newValue)
                } else {
                    guard let secondToken = temporaryOperandStorage.pop() else { return nil }
                    guard let firstToken = temporaryOperandStorage.pop() else { return nil }
                    guard let secondOperand = secondToken as? BinaryOperand else { return nil }
                    guard let firstOperand = firstToken as? BinaryOperand else { return nil }
                    let newValue = checkBinaryMaxLength(value: BinaryCalculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                    intermediateCalculationToken = BinaryOperand(value: newValue)
                }

                guard let intermediateCalculationResult = intermediateCalculationToken else { return nil }
                temporaryOperandStorage.push(element: intermediateCalculationResult)
            default:
                return nil
            }
        }
        
        guard let calculationResultToken = temporaryOperandStorage.pop() else { return nil }
        return calculationResultToken
    }
    
    private func checkBinaryMaxLength(value: Int) -> Int {
        var newValue = 0
        
        if (value > 0) {
            let positiveBinaryLimitSize = 9
            if (getBinaryLengthSize(value) > positiveBinaryLimitSize) {
                if let positiveBinaryLimitValue = Int("1_000_000_000", radix: 2) {
                    newValue = value - positiveBinaryLimitValue
                }
            }
        } else if (value < 0) {
            let negativeBinaryLimitSize = 10
            if (getBinaryLengthSize(value) > negativeBinaryLimitSize) {
                if let negativeBinaryLimitValue = Int("1_000_000_000", radix: 2) {
                    newValue = value - negativeBinaryLimitValue
                }
            }
        }
        
        return newValue
    }
    
    private func getBinaryLengthSize(_ value: Int) -> Int {
        String(value, radix: 2).count
    }
}
