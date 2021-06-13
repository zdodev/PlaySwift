var visited = Array(repeating: Array(repeating: false, count: 100), count: 100)

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let m = input[0]
        let n = input[1]
        
        var x = 0, y = 0
        var dir = 0
        var result = 0
        
        // →, ↓, ←, ↑
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        
        while true {
            if visited[x][y] {
                print(result - 1)
                return
            }
            
            visited[x][y] = true
            var nextX = x + dx[dir]
            var nextY = y + dy[dir]
            
            if nextX < 0 || nextY < 0 || nextX >= m || nextY >= n || visited[nextX][nextY] {
                dir = (dir + 1) % 4
                nextX = x + dx[dir]
                nextY = y + dy[dir]
                result += 1
            }
            
            x = nextX
            y = nextY
        }
    }
}

Solution().solution()
