struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let apple = input[0] * 7
        let pear = input[1] * 13
        
        if apple > pear {
            print("Axel")
        } else if apple < pear {
            print("Petra")
        } else {
            print("lika")
        }
    }
}

Solution().solution()
