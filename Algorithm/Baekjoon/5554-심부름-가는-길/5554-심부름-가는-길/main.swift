import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func calculateTotalTralvelTimeSeconds(_ numbers: [Int]) -> Int {
        numbers.reduce(0) { (result, element) in
            result + element
        }
    }
    
    private func calcuateSecondsToMinites(_ seconds: Int) -> (Int, Int) {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return (minutes, seconds)
    }
    
    func solution() {
        var lnput = [Int]()
        for _ in 0..<4 {
            lnput.append(readInteger())
        }
        
        let totalTravelTimeSeconds = calculateTotalTralvelTimeSeconds(lnput)
        let minutesAndSeconds = calcuateSecondsToMinites(totalTravelTimeSeconds)
        print(minutesAndSeconds.0)
        print(minutesAndSeconds.1)
    }
}

Solution().solution()
