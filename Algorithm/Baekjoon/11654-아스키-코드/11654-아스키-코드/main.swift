struct Solution {
    private func readString() -> String {
        readLine()!
    }
    
    private func characterToASCII(_ character: String) -> UInt32 {
        UnicodeScalar(character)!.value
    }
    
    func solution() {
        let input = readString()
        let output = characterToASCII(input)
        print(output)
    }
}

Solution().solution()
