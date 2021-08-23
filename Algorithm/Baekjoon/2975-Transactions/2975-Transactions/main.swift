struct Solution {
    private func readInputs() -> (Int, String, Int) {
        let input = readLine()!.split(separator: " ")
        let result = (Int(input[0])!, String(input[1]), Int(input[2])!)
        return result
    }
    
    func solution() {
        var input = readInputs()
        
        while !(input.0 == 0 && input.1 == "W" && input.2 == 0) {
            if input.1 == "D" {
                print(input.0 + input.2)
            } else {
                if input.0 - input.2 < -200 {
                    print("Not allowed")
                } else {
                    print(input.0 - input.2)
                }
            }
            
            input = readInputs()
        }
    }
}

Solution().solution()
