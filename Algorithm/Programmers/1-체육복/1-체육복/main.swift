import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = Array(repeating: 1, count: n + 2)
    students[0] = 0
    students[n + 1] = 0
    
    for index in lost {
        students[index] = 0
    }
    
    for index in reserve {
        students[index] += 1
    }
    
    for index in 1...n {
        if students[index] == 0 {
            if students[index - 1] >= 2 {
                students[index] += 1
                students[index - 1] -= 1
            } else if students[index + 1] >= 2{
                students[index] += 1
                students[index + 1] -= 1
            }
        }
    }
    
    let count = students.filter { element in
        element >= 1
    }.count
    
    return count
}

//let n = 5
//let lost = [2, 4]
//let reserve = [1, 3, 5]

//let n = 5
//let lost = [2, 4]
//let reserve = [3]

//let n = 3
//let lost = [3]
//let reserve = [1]

print(solution(n, lost, reserve))
