import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func isBiggerThanSalePrice(_ salePrice: Int, _ productionExpense: Int) -> Bool {
        productionExpense >= salePrice ? true : false
    }
    
    private func findX(_ fixedCost: Int, _ productionExpense: Int, _ salePrice: Int) -> Int {
        fixedCost / (salePrice - productionExpense) + 1
    }
    
    func solution() {
        let input = readIntegers()
        var output = 0
        
        if isBiggerThanSalePrice(input[2], input[1]) {
            output = -1
        } else {
            output = findX(input[0], input[1], input[2])
        }
        
        print(output)
    }
}

Solution().solution()

