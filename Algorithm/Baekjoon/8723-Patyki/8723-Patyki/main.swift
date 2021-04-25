import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func isRightTriangle(_ legs: [Int]) -> Bool {
        let maxLeg = legs[2]
        let firstLeg = legs[0]
        let secondLeg = legs[1]
        
        return firstLeg * firstLeg + secondLeg * secondLeg == maxLeg * maxLeg
    }
    
    private func isEquilateralTriangle(_ legs: [Int]) -> Bool {
        legs[0] == legs[1] && legs[1] == legs[2]
    }
    
    func solution() {
        let legs = readIntegers().sorted()
        
        let possibleRightTriangle = isRightTriangle(legs)
        let possibleEquilateralTriangle = isEquilateralTriangle(legs)
        
        if possibleRightTriangle {
            print(1)
        } else if possibleEquilateralTriangle {
            print(2)
        } else {
            print(0)
        }
    }
}

Solution().solution()
