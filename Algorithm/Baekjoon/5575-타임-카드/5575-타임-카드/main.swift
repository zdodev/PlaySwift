import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func calculateTimeToSecond(_ time: [Int]) -> Int {
        time[0] * 3600 + time[1] * 60 + time[2]
    }
    
    private func calculateSecondToTime(_ second: Int) -> [Int] {
        let hour = second / 3600
        let minute = (second % 3600) / 60
        let second = (second % 3600) % 60
        return [hour, minute, second]
    }
    
    func solution() {
        let workingTimes: [[Int]] = {
            var workingTimes = [[Int]]()
            for _ in 0..<3 {
                workingTimes.append(readIntegers())
            }
            return workingTimes
        }()
        
        for index in 0..<3 {
            let startTime = [workingTimes[index][0], workingTimes[index][1], workingTimes[index][2]]
            let endTime = [workingTimes[index][3], workingTimes[index][4], workingTimes[index][5]]
            
            let startTimeToSecond = calculateTimeToSecond(startTime)
            let endTimeToSecond = calculateTimeToSecond(endTime)
            
            let workingTimeToSecond = endTimeToSecond - startTimeToSecond
            
            let workingTime = calculateSecondToTime(workingTimeToSecond)
            let workingTimeToString = workingTime.map {
                String($0)
            }.joined(separator: " ")
            
            print(workingTimeToString)
        }
    }
}

Solution().solution()
