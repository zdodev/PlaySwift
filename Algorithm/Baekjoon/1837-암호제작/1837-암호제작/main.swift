import Foundation

//struct Solution {
//    var sieveOfEratosthenesArray = Array(repeating: true, count: 1_000_001)
//    var primeNumbers = [Int]()
//
//    private func readStrings() -> [String] {
//        readLine()!.split(separator: " ").map {
//            String($0)
//        }
//    }
//
//    mutating func solution() {
//        let input = readStrings()
//        let crytoNumber = input[0]
//        let k = Int(input[1])!
//
//        sieveOfEratosthenes(k)
//        arrayToPrimeNumbers(k)
//
//        for primeNumber in primeNumbers {
//            var ret = 0
//            for element in String(crytoNumber) {
//                ret = (ret * 10 + Int(String(element))!) % primeNumber
//            }
//            if ret == 0 {
//                print("BAD \(primeNumber)")
//                return
//            }
//        }
//        print("GOOD")
//    }
//
//    private mutating func arrayToPrimeNumbers(_ k: Int) {
//        for index in 2...k {
//            if sieveOfEratosthenesArray[index] == true {
//                primeNumbers.append(index)
//            }
//        }
//    }
//
//    private mutating func sieveOfEratosthenes(_ number: Int) {
//        for number1 in 2...Int(sqrt(Double(number))) + 1 {
//            if sieveOfEratosthenesArray[number1] == false {
//                continue
//            }
//
//            var temp = number1
//            while true {
//                temp += number1
//                if temp <= number {
//                    break
//                }
//                sieveOfEratosthenesArray[temp] = false
//            }
//        }
//    }
//}
//
//var solution = Solution()
//solution.solution()

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
