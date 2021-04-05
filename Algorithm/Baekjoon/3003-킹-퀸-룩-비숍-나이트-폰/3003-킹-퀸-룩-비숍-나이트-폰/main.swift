import Foundation

struct Solution {
    private let perfectChessPiece = [1, 1, 2, 2, 2, 8]
    
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    private func insuffcientChessPiece(_ pieces: [Int]) -> [Int] {
        var newPiece = [Int]()
        
        for index in 0..<pieces.count {
            let piece = perfectChessPiece[index] - pieces[index]
            newPiece.append(piece)
        }
        
        return newPiece
    }
    
    func result(_ pieces: [Int]) -> [Int] {
        insuffcientChessPiece(pieces)
    }
    
    func solution() {
        let input = readIntegers()
        let output = result(input).reduce("") { (result, element) in
            if result == "" {
                return "\(element)"
            }
            return "\(result) \(element)"
        }
        print(output)
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [0, 1, 2, 2, 2, 7],
        [1, 1, 2, 2, 2, 8],
        [0, 0, 1, 1, 1, 7]
    ]
    let result = [
        [1, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0],
        [1, 1, 1, 1, 1, 1]
    ]
}
