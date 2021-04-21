struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let buggers: [Int] = {
            var buggers = [Int]()
            for _ in 1...3 {
                buggers.append(readInteger())
            }
            return buggers
        }()
        let drinks: [Int] = {
            var drinks = [Int]()
            for _ in 1...2 {
                drinks.append(readInteger())
            }
            return drinks
        }()
        
        let minimalPriceBugger = buggers.min()!
        let minimalPriceDrink = drinks.min()!
        
        let setPrice = minimalPriceDrink + minimalPriceBugger - 50
        
        print(setPrice)
    }
}

Solution().solution()
