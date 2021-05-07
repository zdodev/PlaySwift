struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        if input[0] == 0 && input[1] == 0 {
            print("Not a moose")
            return
        }
        
        if input[0] == input[1] {
            print("Even \(input[0] * 2)")
        } else {
            print("Odd \(input.max()! * 2)")
        }
    }
}

Solution().solution()
