struct Solution {
    private func readString() -> String {
        readLine()!
    }
    
    private func convertOctalToBinary(_ octal: Character) -> String {
        String(octal.wholeNumberValue!, radix: 2)
    }
    
    func solution() {
        let input = readString()
        var output = ""
        for (i, characterDigit) in input.enumerated() {
            let digit = convertOctalToBinary(characterDigit)
            var joinStr = ""
            if i != 0 {
                joinStr = Array(repeating: "0", count: 3 - digit.count).joined()
            }
            output += joinStr + digit
        }
        print(output)
    }
}

Solution().solution()
