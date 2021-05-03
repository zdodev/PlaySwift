struct Solution {
    private func readInteger() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    private func mergeArray(_ array1: [Int], _ array2: [Int]) -> [Int] {
        var newArray = [Int]()
        newArray.reserveCapacity(2_000_001)
        
        var up = 0
        var down = 0
        
        while up < array1.count && down < array2.count {
            if array1[up] <= array2[down] {
                newArray.append(array1[up])
                up += 1
            } else {
                newArray.append(array2[down])
                down += 1
            }
        }
        
        while up < array1.count {
            newArray.append(array1[up])
            up += 1
        }
        
        while down < array2.count {
            newArray.append(array2[down])
            down += 1
        }
        
        return newArray
    }
    
    func solution(_ array1: [Int], _ array2: [Int]) -> [Int] {
        let mergedArray = mergeArray(array1, array2)

        return mergedArray
    }
    
    func output() {
        _ = readInteger()
        let array1 = readInteger()
        let array2 = readInteger()
        
        let result = solution(array1, array2).map {
            String($0)
        }.joined(separator: " ")
        print(result)
    }
}

Solution().output()

struct TestCase {
    let input1 = [
        [3, 5],
        [4, 7],
        [2, 3, 5, 9],
    ]
    
    let input2 = [
        [2, 9],
        [1],
        [1, 4, 7],
    ]
    
    let output = [
        [2, 3, 5, 9],
        [1, 4, 7],
        [1, 2, 3, 4, 5, 7, 9],
    ]
}
