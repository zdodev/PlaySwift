struct Solution {
    private func readHangul() -> String {
        readLine()!
    }
    
    private func convertHangulToNumber(_ hangul: String) -> UInt32 {
        UnicodeScalar(hangul)!.value - UnicodeScalar(44031)!.value
    }
    
    func solution() {
        let input = readHangul()
        let output = convertHangulToNumber(input)
        print(output)
    }
}

Solution().solution()
