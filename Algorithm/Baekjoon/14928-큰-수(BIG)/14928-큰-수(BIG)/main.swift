struct Solution {
    private func readString() -> String {
        readLine()!
    }

    func solution() {
        let input = readString()
        var result = 0
        for digit in input {
            result = (result * 10 + Int((digit.asciiValue! - Character("0").asciiValue!))) % 20000303
        }
        print(result)
    }
}

Solution().solution()

