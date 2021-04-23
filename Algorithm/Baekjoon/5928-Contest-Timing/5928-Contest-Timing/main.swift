import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func timeToMinute(_ time: [Int]) -> Int {
        let dayTimeToMinute = time[0] * 1440
        let hourTimeToMinute = time[1] * 60
        let minute = time[2]
        return dayTimeToMinute + hourTimeToMinute + minute
    }
    
    func solution() {
        let input = [11, 11, 11]
        let contentMinute = timeToMinute(input)
        
        let endTime = readIntegers()
        let endTimeToMinute = timeToMinute(endTime)
        
        let takenTime = endTimeToMinute - contentMinute
        if takenTime >= 0 {
            print(takenTime)
        } else {
            print(-1)
        }
    }
}

Solution().solution()
