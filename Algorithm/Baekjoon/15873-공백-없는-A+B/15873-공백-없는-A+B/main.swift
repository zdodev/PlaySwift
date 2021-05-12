struct Solution {
    private func readString() -> String {
        readLine()!
    }
    
    func solution() {
        let input = readString()
        
        var sum = 0
        
        if input.count == 2 {
            sum = input.reduce(0, { result, character in
                result + Int(String(character))!
            })
            print(sum)
            return
        }
        
        var anotherNumber = 0
        
        if input.count == 3 {
            var index = input.index(input.startIndex, offsetBy: 1)
            if input[index] == "0" {
                index = input.index(input.startIndex, offsetBy: 2)
                anotherNumber = Int(String(input[index]))! + 10
            } else {
                index = input.index(input.startIndex, offsetBy: 0)
                anotherNumber = Int(String(input[index]))! + 10
            }
            print(anotherNumber)
            return
        }
        
        if input.count == 4 {
            print(20)
            return
        }
    }
}

Solution().solution()
