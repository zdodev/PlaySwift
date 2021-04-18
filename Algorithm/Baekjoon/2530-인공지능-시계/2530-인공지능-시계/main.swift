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
    
    private func convertCurrentTimeToSeconds(_ time: [Int]) -> Int {
        let hourToSeconds = time[0] * 3600
        let minuteToSeconds = time[1] * 60
        let seconds = time[2]
        return hourToSeconds + minuteToSeconds + seconds
    }
    
    func solution() {
        let currentTime = readIntegers()
        let cookingTime = readInteger()
        let currentTimeToSeconds = convertCurrentTimeToSeconds(currentTime)
        let totalSeconds = cookingTime + currentTimeToSeconds
        let cookingHour = (totalSeconds / 3600) % 24
        let cookingMinute = (totalSeconds / 60) % 60
        let cookingSecond = totalSeconds % 60
        print("\(cookingHour) \(cookingMinute) \(cookingSecond)")
    }
}

Solution().solution()
