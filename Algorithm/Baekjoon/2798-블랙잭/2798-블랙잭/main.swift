struct Solution {
    private func readInteger() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let M = readInteger()[1]
        let array = readInteger()
        
        var sum = Int.min
        
        for first in 0..<array.count - 2 {
            for second in first + 1..<array.count - 1 {
                for third in second + 1..<array.count {
                    let sumOfCards = array[first] + array[second] + array[third]
                    if sumOfCards <= M && sumOfCards > sum {
                        sum = sumOfCards
                    }
                }
            }
        }
        
        print(sum)
    }
}

Solution().solution()
