// 1부터 n까지의 합을 순환함수로 구현
func sum(_ number: Int) -> Int {
    if number == 1 {
        return 1
    }
    return number + sum(number - 1)
}

print(sum(10))

// 1부터 n까지의 합을 꼬리 순환함수로 구현
func sumTailRecursion(_ number: Int) -> Int {
    func sum(_ number: Int, _ acc: Int) -> Int {
        if number == 0 {
            return acc
        }
        return sum(number - 1, acc + number)
    }
    return sum(number, 0)
}

print(sumTailRecursion(10))

// 팩토리얼 순환함수
func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    }
    return factorial(number - 1) * number
}

print(factorial(5))

// 팩토리얼 꼬리 순환함수
func factorialTailRecursion(_ number: Int) -> Int {
    func factorial(_ number: Int, _ result: Int) -> Int {
        if number == 0 {
            return result
        }
        return factorial(number - 1, result * number)
    }
    return factorial(number, 1)
}

print(factorialTailRecursion(5))

// 더 멋진 팩토리얼 꼬리 순환함수

print(Array(1...5).reduce(1, *))

// 피보나치 수열 순환함수
func fibonacci(_ number: Int) -> Int {
    if number <= 1 {
        return number
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

print(fibonacci(5))

// 피보나치 수열 꼬리 순환함수
func fibonacciTailRecursion(_ number: Int) -> Int {
    func fibonacci(_ first: Int, _ second: Int, _ count: Int) -> Int {
        if count == 0 {
            return first
        }
        return fibonacci(second, first + second, count - 1)
    }
    return fibonacci(0, 1, number)
}

print(fibonacciTailRecursion(5))
