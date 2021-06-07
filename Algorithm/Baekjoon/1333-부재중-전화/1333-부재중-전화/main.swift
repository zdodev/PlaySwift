struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        var music = [Int]()
        var bell = 0
        let n = input[0]
        let l = input[1]
        let d = input[2]

        // 노래가 n번만 반복되는 것을 표현
        for _ in 0..<n {
            // l초동안 음악 재생
            for _ in 0..<l {
                music.append(1)
            }
            
            // 5초동안 공백
            for _ in 0..<5 {
                music.append(0)
            }
        }
        
        while true {
            // 노래가 끝나고 벨이 울리면 종료
            if bell >= music.count {
                break
            }
            
            // 노래 중간 공백 시간에 벨이 울리면 종료
            if music[bell] == 0 {
                break
            } else {
                bell += d
            }
        }
        
        print(bell)
    }
}

Solution().solution()
