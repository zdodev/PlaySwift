import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func convertTimeToMinute(_ time: [Int]) -> Int {
        time[0] * 60 + time[1]
    }
    
    private func convertMinuteToTime(_ minute: Int) -> [Int] {
        let cookingHour = (minute / 60) % 24
        let cookingMinute = minute % 60
        return [cookingHour, cookingMinute]
    }
    
    func solution() {
        let currentTime = readIntegers()
        let cookTime = readInteger()
        let totalMinute = convertTimeToMinute(currentTime) + cookTime
        let output = convertMinuteToTime(totalMinute)
        print("\(output[0]) \(output[1])")
    }
}

Solution().solution()
