import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func countElementEquality(_ numbers: [Int]) -> Int {
        var newArray = [Int]()
        var sameElement = 0
        
        numbers.forEach { (element) in
            if !newArray.contains(element) {
                newArray.append(element)
            } else {
                sameElement = element
            }
        }
        
        if newArray.count == 1 {
            return sameElement * 1000 + 10000
        } else if newArray.count == 2 {
            return sameElement * 100 + 1000
        } else {
            return numbers.max()! * 100
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = countElementEquality(input)
        print(output)
    }
}

Solution().solution()
