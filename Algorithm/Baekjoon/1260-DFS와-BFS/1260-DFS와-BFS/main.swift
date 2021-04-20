import Foundation

struct Solution {
    var visited = [Bool]()
    var dfsResult = [Int]()
    var bfsResult = [Int]()
    
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private mutating func dfs(_ graph: [[Int]], _ vertex: Int) {
        visited[vertex] = true
        dfsResult.append(vertex)
        
        for next in graph[vertex] {
            if !visited[next] {
                dfs(graph, next)
            }
        }
    }
    
    private mutating func bfs(_ graph: [[Int]], _ vertex: Int) {
        var queue = [vertex]
        visited[vertex] = true
        
        while !queue.isEmpty {
            guard let element = queue.first else {
                return
            }
            bfsResult.append(element)
            queue.removeFirst()
            
            for next in graph[element] {
                if !visited[next] {
                    visited[next] = true
                    queue.append(next)
                }
            }
        }
    }
    
    mutating func solution() {
        let input = readIntegers()
        let v = input[0]
        let e = input[1]
        let startVertex = input[2]
        
        visited = Array(repeating: false, count: v + 1)
        var graph: [[Int]] = Array(repeating: [], count: v + 1)
        
        // 그래프를 생성합니다.
        for _ in 1...e {
            let edge = readIntegers()
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        for index in 1...v {
            graph[index].sort()
        }
        
        dfs(graph, startVertex)
        let dfsStringResult = dfsResult.map {
            String($0)
        }.joined(separator: " ")
        print(dfsStringResult)
        
        visited = Array(repeating: false, count: v + 1)
        
        bfs(graph, startVertex)
        let bfsStringResult = bfsResult.map {
            String($0)
        }.joined(separator: " ")
        print(bfsStringResult)
    }
}

var solution = Solution()
solution.solution()
