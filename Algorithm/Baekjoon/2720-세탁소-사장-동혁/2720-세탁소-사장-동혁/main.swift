struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let testcase = readInteger()
        
        let quarter = 25
        let dime = 10
        let nickel = 5
        let penny = 1
        
        var quarterCount = 0
        var dimeCount = 0
        var nickelCount = 0
        var pennyCount = 0
        
        for _ in 1...testcase {
            var money = readInteger()
            
            quarterCount = money / quarter
            money %= quarter
            
            dimeCount = money / dime
            money %= dime
            
            nickelCount = money / nickel
            money %= nickel
            
            pennyCount = money / penny
            
            print("\(quarterCount) \(dimeCount) \(nickelCount) \(pennyCount)")
        }
    }
}

Solution().solution()
