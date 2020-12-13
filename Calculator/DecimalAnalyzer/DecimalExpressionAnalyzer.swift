struct DecimalExpressionAnalyzer {
    func convertExpressionToToken(expression: String) -> [DecimalToken]? {
        let splitString = expression.split(separator: " ")
        let arithmeticOperators: [String] = {
            var operatorRawValues = [String]()
            DecimalOperator.Arithmetic.allCases.forEach {
                operatorRawValues.append($0.rawValue)
            }
            return operatorRawValues
        }()
        var tokenExpression = [DecimalToken]()
        
        for element in splitString {
            let stringElement = String(element)
            if let integer = Int(stringElement) {
                let newInteger = checkIntegerMaxLength(value: integer)
                tokenExpression.append(IntegerOperand(value: newInteger))
            } else if let realNumber = Double(stringElement) {
                tokenExpression.append(RealNumberOperand(value: realNumber))
            } else if arithmeticOperators.contains(stringElement) {
                guard let arithmeticOperator = DecimalOperator.convertStringOperatorToArithmeticOperator(operator: stringElement) else {
                    return nil
                }
                tokenExpression.append(DecimalOperator(value: arithmeticOperator, priority: DecimalOperator.getOperatorPrecedence(operator: arithmeticOperator)))
            }
        }
        
        return tokenExpression
    }
    
    private func checkIntegerMaxLength(value: Int) -> Int {
        var newValue = 0
        
        if (value > 0) {
            let positiveIntegerLimitSize = 10
            if (getIntegerLengthSize(value) >= positiveIntegerLimitSize) {
                newValue = value - 1_000_000_000
            }
        } else if (value < 0) {
            let negativeIntegerLimitSize = 11
            if (getIntegerLengthSize(value) >= negativeIntegerLimitSize) {
                newValue = value + 1_000_000_000
            }
        }
        
        return newValue
    }
    
    private func getIntegerLengthSize(_ value: Int) -> Int {
        String(value).count
    }
}
