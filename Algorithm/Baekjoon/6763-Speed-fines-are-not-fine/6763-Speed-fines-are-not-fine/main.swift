struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let limitSpeed = readInteger()
        let currentSpeed = readInteger()
        
        let differenceSpeed = currentSpeed - limitSpeed
        
        if differenceSpeed >= 31 {
            print("You are speeding and your fine is $500.")
        } else if differenceSpeed >= 21 {
            print("You are speeding and your fine is $270.")
        } else if differenceSpeed >= 1 {
            print("You are speeding and your fine is $100.")
        } else {
            print("Congratulations, you are within the speed limit!")
        }
    }
}

Solution().solution()
