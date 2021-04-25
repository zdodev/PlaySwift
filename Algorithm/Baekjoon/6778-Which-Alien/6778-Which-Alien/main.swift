struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func isTroyMartian(_ antenna: Int, _ eye: Int) -> Bool {
        antenna >= 3 && eye <= 4
    }
    
    private func isVladSaturnian(_ antenna: Int, _ eye: Int) -> Bool {
        antenna <= 6 && eye >= 2
    }
    
    private func isGraemeMercurian(_ antenna: Int, _ eye: Int) -> Bool {
        antenna <= 2 && eye <= 3
    }
    
    func solution() {
        let antenna = readInteger()
        let eye = readInteger()
        
        if isTroyMartian(antenna, eye) {
            print("TroyMartian")
        }
        
        if isVladSaturnian(antenna, eye) {
            print("VladSaturnian")
        }
        
        if isGraemeMercurian(antenna, eye) {
            print("GraemeMercurian")
        }
    }
}

Solution().solution()
