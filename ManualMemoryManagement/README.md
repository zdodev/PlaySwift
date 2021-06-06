# 수동 메모리 관리 (Manual Memory Management)

애플의 Manual Memory Management는 메모리를 수동으로 할당하고 관리할 수 있는 기능을 제공합니다.

### Unmanaged

```swift
// 힙에 생성된 인스턴스의 주소를 출력합니다.
print(Unmanaged.passUnretained(reference).toOpaque())
```

### withUnsafePointer(to:_:)

```swift
// 스택에 생성된 변수의 주소를 출력합니다.
withUnsafePointer(to: &value) {
    print($0)
}
```

### 참고 URL

---

>[Apple Manual Memory Management](https://developer.apple.com/documentation/swift/swift_standard_library/manual_memory_management)
