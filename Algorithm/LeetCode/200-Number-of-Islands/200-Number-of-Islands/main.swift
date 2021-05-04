class Solution {
    // 입력으로 받을 그래프를 저장할 프로퍼티
    private var graph: [[Character]] = [["0"]]
    
    // dfs를 수행할 메서드
    private func dfs(_ row: Int, _ column: Int) {
        /*
         땅이 아닌 지점은 더 이상 탐색을 하지 않는다.
         1. 인덱스를 벗어나는 지점
         2. 땅이 아닌 지점 == "0"
         */
        if row < 0 || row >= graph.count || column < 0 || column >= graph[0].count || graph[row][column] == "0" {
            return
        }
        
        // 땅인 지역을 탐색했다는 의미,
        graph[row][column] = "0"
        
        // 현재 정점을 기준으로 이어진 정점을 탐색한다.
        // 연속된 땅을 하나로 보기 위함이다.
        dfs(row + 1, column)
        dfs(row - 1, column)
        dfs(row, column + 1)
        dfs(row, column - 1)
    }
    
    // LeetCode에서 주어진 메서드
    func numIslands(_ grid: [[Character]]) -> Int {
        // 그래프 초기화
        graph = grid
        
        // 땅의 수를 세는 프로퍼티
        var count = 0
        
        // 땅을 처음부터 끝점까지 탐색 시작
        for row in 0..<graph.count {
            for column in 0..<graph[0].count {
                // 현재 정점이 만약 땅이면 dfs 수행
                if graph[row][column] == "1" {
                    dfs(row, column)
                    // 현재 정점에서 이어진 정점의 땅 탐색이 끝나면 섬의 수 증가
                    count += 1
                }
            }
        }
        
        return count
    }
}

struct TestCase {
    let testCase: [[[Character]]] = [
        [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"],
        ],
        [
            
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"],
        ],
        [
            ["1", "0", "1"],
            ["0", "1", "0"],
            ["1", "0", "1"],
        ],
    ]
    
    let output = [
        1,
        3,
        5,
    ]
}
