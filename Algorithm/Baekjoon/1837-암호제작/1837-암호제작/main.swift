import Foundation

let input = readLine()!.split(separator: " ")
let p = input[0]
let k = input[1]
let arrayRange = 1_000_001

var e = Array(repeating: false, count: arrayRange)
var result = 0

// Sieve Of Eratosthenes
for i in 2...1001 {
    if e[i] == false {
        var n = i * 2
        while n < arrayRange {
            e[n] = true
            n += i
        }
    }
}

for i in 2..<arrayRange {
    if e[i] == false {
        if mod(i) {
            break
        }
    }
}

if result == 0 {
    print("GOOD")
} else {
    if result < Int(k)! {
        print("BAD \(result)")
    } else {
        print("GOOD")
    }
}

func mod(_ num: Int) -> Bool {
    var ret = 0
    for element in p {
        ret = (ret * 10 + Int(String(element))!) % num
    }
    if ret == 0 {
        result = num
        return true
    } else {
        return false
    }
}
