# 꼬리 순환

순환함수란 하나의 함수를 반복해서 호출하는 형태로 정의하는 것을 순환함수라고 합니다. 꼬리 순환함수는 함수 자신의 결과를 바로 반환하여 추가적인 연산를 하지 않고 이전 순환함수를 종료합니다.

## 1부터 n까지의 합

### 순환함수

```swift
func sum(_ number: Int) -> Int {
    // 순환 종료조건
    if number == 1 {
        return 1
    }
    // number의 값을 1씩 빼면서 계속 더한다.
    return number + sum(number - 1)
}

print(sum(10))
// 55
```

### 꼬리 순환함수

```swift
func sumTailRecursion(_ number: Int) -> Int {
    func sum(_ number: Int, _ acc: Int) -> Int {
        // 순환 종료조건
        if number == 0 {
            return acc
        }
        // 알고리즘 로직
        return sum(number - 1, acc + number)
    }
    // 함수 결과 반환
    return sum(number, 0)
}

print(sumTailRecursion(10))
// 55
```

## 팩토리얼

### 순환함수

```swift
func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    }
    return factorial(number - 1) * number
}

print(factorial(5))
// 120
```

### 꼬리 순환함수

```swift
func factorialTailRecursion(_ number: Int) -> Int {
    func factorial(_ number: Int, _ result: Int) -> Int {
        // 순환 종료조건
        if number == 0 {
            return result
        }
        // 알고리즘 로직
        return factorial(number - 1, result * number)
    }
    // 함수 결과 반환
    return factorial(number, 1)
}

print(factorialTailRecursion(5))
// 120
```

### 더 멋진 꼬리 순환함수

```swift
print(Array(1...5).reduce(1, *))
// 120
```



## 피보나치 수열

### 순환함수

```swift
func fibonacci(_ number: Int) -> Int {
    if number <= 1 {
        return number
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

print(fibonacci(5))
// 5
```

### 꼬리 순환함수

```swift
func fibonacciTailRecursion(_ number: Int) -> Int {
    func fibonacci(_ first: Int, _ second: Int, _ count: Int) -> Int {
        // 순환 종료조건
        if count == 0 {
            return first
        }
        // 알고리즘 로직
        return fibonacci(second, first + second, count - 1)
    }
    // 함수 결과 반환
    return fibonacci(0, 1, number)
}

print(fibonacciTailRecursion(5))
// 5
```

