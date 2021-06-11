import Foundation

struct Solution {
    func solution() {
        print(isPrimeNumber(17))
    }
    
    private func isPrimeNumber(_ number: Int) -> Bool {
        if number == 2 {
            return true
        }
        
        let squareRootOfNumber = Int(sqrt(Double(number))) + 1
        
        for i in 2...squareRootOfNumber {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
}

Solution().solution()
