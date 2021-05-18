import Foundation

struct Solution {
    private func readDoubles() -> [Double] {
        readLine()!.split(separator: " ").map {
            Double($0)!
        }
    }
    
    func area(_ number: [Double]) -> Double {
        pow(Double(number[0]), 2) * Double.pi
    }
    
    func solution() {
        let input1 = readDoubles()
        let firstAreaPerDollar = input1[0] / input1[1]
        
        let input2 = readDoubles()
        let secondAreaPerDollar = area(input2) / input2[1]
        
        if firstAreaPerDollar > secondAreaPerDollar {
            print("Slice of pizza")
        } else {
            print("Whole pizza")
        }
    }
}

Solution().solution()

struct TestCase {
    let input = [
        [[8, 4], [7, 9]],
    ]
    
    let output = [
        "Whole pizza"
    ]
}
