//MARK: - 표준 입력받기
// 반환 타입: String?
let input = readLine()!

// 표준 입력 공백 단위로 분리하기
// split 메서드 반환 타입: [String.SubSequence]
// map 메서드를 사용하여 원하는 데이터로 가공
let inputs = readLine()!.split(separator: " ").map {
    Int($0)!
}

//MARK: - 표준 출력하기
print(input)

// 표준 출력 마지막 문자 변경하기
print(input, terminator: "")

//MARK: - 배열 만들기

// 빈 배열 만들기
var array = [Int]()

// 특정 값으로 저장된 배열 만들기
var array2 = Array(repeating: 3, count: 5)

// 빈 2차원 배열 만들기
var matrix = [[Int]]()

// 2차원 배열 탐색
var matrix1 = [
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
]

for row in 0..<matrix1.count {
    for column in 0..<matrix1[0].count {
        let val = matrix1[row][column]
    }
}

// 2차원 배열 방향 탐색
let dx = [0, -1, 0, 1]
let dy = [1, 0, -1, 0]

let x = 2
let y = 2

for index in 0...2 {
    let nx = x + dx[index]
    let ny = y + dy[index]
}

// 배열 뒤집기
array.reverse()

//MARK: 문자열 인덱스 다루기
let string = "string"

// 첫 인덱스 구하기
// String.Index
let firstIndex = string.startIndex

// 마지막 인덱스 구하기
// String.Index
let lastIndex = string.index(before: string.endIndex)

// n번째 인덱스 구하기
// String.Index
let nIndex = string.index(firstIndex, offsetBy: 0)

// n번째 인덱스 문자 출력하기
print(string[nIndex])

// 특정 문자 인덱스 찾기
let index = string.firstIndex(of: "t")!

//MARK: - 진법 표현
// 십진법 -> N진법
let binary = String(14, radix: 2)

// N진법 -> 십진법
let decimal = Int("1101", radix: 2)!
