import Foundation

struct Multiplication {
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        lhs * rhs
    }
    
//    func isolateDigit(_ number: Int) -> [Int] {
//        var tempValue = number
//        let hundredNumber = (tempValue / 100) * 100
//        tempValue %= 100
//        let tenNubmer = (tempValue / 10) * 10
//        tempValue %= 10
//        let unitNumber = tempValue
//        return [hundredNumber, tenNubmer, unitNumber]
//    }
    
    func isolateUnitDigit(_ number: Int) -> Int {
        number % 10
    }
    
    func isolateTensDigit(_ number: Int) -> Int {
        let newNumber = number % 100
        return newNumber / 10
    }
    
    func isolateHundredsDigit(_ number: Int) -> Int {
        number / 100
    }
    
    func makeUnitDigitMultiplicationResult(_ firstNumber: Int, _ number: Int) -> Int {
        let unitDigit = isolateUnitDigit(number)
        return firstNumber * unitDigit
    }
    
    func makeTensDigitMultiplicationResult(_ firstNumber: Int, _ number: Int) -> Int {
        let tensDigit = isolateTensDigit(number)
        return firstNumber * tensDigit
    }
    
    func makeHundredsDigitMultiplicationResult(_ firstNumber: Int, _ number: Int) -> Int {
        let hundredsDigit = isolateHundredsDigit(number)
        return firstNumber * hundredsDigit
    }
}

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func result() {
        let multiplication = Multiplication()
        let firstNumber = readInteger()
        let secondNubmer = readInteger()
        
        let unitDigitMuliplication = multiplication.makeUnitDigitMultiplicationResult(firstNumber, secondNubmer)
        print(unitDigitMuliplication)
        
        let tensDigitMuliplication = multiplication.makeTensDigitMultiplicationResult(firstNumber, secondNubmer)
        print(tensDigitMuliplication)
        
        let hundredsDigitMuliplication = multiplication.makeHundredsDigitMultiplicationResult(firstNumber, secondNubmer)
        print(hundredsDigitMuliplication)
        
        let twoNumberMultiplication = multiplication.multiply(firstNumber, secondNubmer)
        print(twoNumberMultiplication)
    }
}

Solution().result()
