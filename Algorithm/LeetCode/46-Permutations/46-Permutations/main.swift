class Solution {
    // 모든 순열이 저장될 프로퍼티
    private var result = [[Int]]()
    // 하나의 완성된 순열리 저장될 프로퍼티
    private var nodes = [Int]()
    
    private func dfs(_ elements: [Int]) {
        // 더 이상 탐색할 번호가 없으면 지금까지 탐색한 것을 저장
        if elements.isEmpty {
            result.append(nodes)
        }
        
        // 트리 구조로 탐색
        for element in elements {
            // 현재 번호를 제거
            var newElements = elements
            let removingIndex = newElements.firstIndex(of: element)!
            newElements.remove(at: removingIndex)
            
            // 현재 번호를 순열에 저장
            nodes.append(element)
            // 순환 탐색
            dfs(newElements)
            print(nodes.removeLast())
        }
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        result.removeAll()
        nodes.removeAll()
        
        dfs(nums)
        return result
    }
}

struct TestCase {
    let input = [
        [1, 2, 3],
        [0, 1],
        [1],
    ]
    
    let output = [
        [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]],
        [[0, 1], [1, 0]],
        [[1]],
    ]
}
