struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var input = [Int]()
        for _ in 1...3 {
            input.append(readInteger())
        }
        
        let total = input.reduce(0) { (result, element) in
            result + element
        }
        if total != 180 {
            print("Error")
            return
        }
        
        if input[0] == input[1] && input[1] == input[2] && input[2] == input[0] {
            print("Equilateral")
        } else if input[0] == input[1] || input[1] == input[2] || input[2] == input[0] {
            print("Isosceles")
        } else {
            print("Scalene")
        }
    }
}

Solution().solution()
