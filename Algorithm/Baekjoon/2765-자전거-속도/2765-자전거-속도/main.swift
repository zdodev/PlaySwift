import Foundation

struct Solution {
    private func readInput() -> (Double, Int, Double) {
        let input = readLine()!.split(separator: " ")
        let diameter = Double(input[0])!
        let rpm = Int(input[1])!
        let second = Double(input[2])!
        
        return (diameter, rpm, second)
    }
    
    func solution() {
        var (diameter, rpm, second) = readInput()
        var count = 1
        
        while rpm != 0 {
            let distance = 2 * Double.pi * diameter / 2 * Double(rpm) / 63360
            let roundedDistance = round(distance * 100) / 100
            
            let speed = distance / second * 3600
            let roundedSpeed = round(speed * 100) / 100
            
            let roundedDistanceFormat = String(format: "%.02f", roundedDistance)
            let roundedSpeedFormat = String(format: "%.02f", roundedSpeed)
            
            print("Trip #\(count): \(roundedDistanceFormat) \(roundedSpeedFormat)")
            
            count += 1
            (diameter, rpm, second) = readInput()
        }
    }
}

Solution().solution()
