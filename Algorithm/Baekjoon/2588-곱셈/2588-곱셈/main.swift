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
        var result = number % 100
        let unitDigit = isolateUnitDigit(result)
        result -= unitDigit
        return result
    }
    
    func isolateHundredsDigit(_ number: Int) -> Int {
        (number / 100) * 100
    }
    
//    func makeUnitDigitMultiplicationResult(_ number: Int) -> Int {
//
//    }
}
