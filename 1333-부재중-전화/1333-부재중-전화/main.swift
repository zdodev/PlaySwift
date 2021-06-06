struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        var n = input[0]
        let l = input[1]
        let d = input[2]
        
        var time = 0
    }
}
