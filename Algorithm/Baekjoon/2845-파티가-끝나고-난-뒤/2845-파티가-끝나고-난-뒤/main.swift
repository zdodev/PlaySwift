import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    private func participantsInTheParty(_ count: Int, _ area: Int) -> Int {
        count * area
    }
    
    private func participantsErrorNumber(_ correct: Int, errors: [Int]) -> [Int] {
        errors.map { element in
            element - correct
        }
    }
    
    func result(_ count: Int, area: Int, errors: [Int]) -> [Int] {
        let exactNumberOfPeople = participantsInTheParty(count, area)
        let errorNumberOfPeoples = participantsErrorNumber(exactNumberOfPeople, errors: errors)
        return errorNumberOfPeoples
    }
    
    func solution() {
        let all = readIntegers()
        let errors = readIntegers()
        let exactNumberOfPeople = participantsInTheParty(all[0], all[1])
        let errorNumberOfPeoples = participantsErrorNumber(exactNumberOfPeople, errors: errors).reduce("") { (result, element) in
            if result == "" {
                return "\(element)"
            }
            return "\(result) \(element)"
        }
        print(errorNumberOfPeoples)
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [5, 20],
        [1, 1],
        [10, 1000]
    ]
    let error = [
        [99, 101, 1000, 0, 97],
        [1, 2, 3, 4, 5],
        [9999, 9999, 9999, 9999, 9999]
    ]
    let result = [
        [-1, 1, 900, -100, -3],
        [0, 1, 2, 3, 4],
        [-1, -1, -1, -1, -1]
    ]
}
