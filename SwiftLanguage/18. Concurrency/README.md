# Concurrency

기존의 비동기 코드 처리 방식은 다음과 같이 completion 인자로 클로저를 받아서 처리하는 식으로 구현했습니다. 이렇게 클로저 중첩이 많아지면 분석하기가 어렵고, 디버깅하기도 어려워집니다.

```swift
// completion 방식의 비동기 처리
func listPhotos(inGallery name: String, completion: ([String]) -> Void) {
    print(name)
    completion(["IMG001", "IMG002", "IMG003"])
}

func downloadPhoto(named: String, completion: (String) -> Void) {
    print(named)
    completion("downloadPhoto1")
}

func process() {
    listPhotos(inGallery: "Summer Vacation") { photoNames in
        let sortedNames = photoNames.sorted()
        let name = sortedNames[1]
        downloadPhoto(named: name) { photo in
            print(photo)
        }
    }
}
```

## Defining and Calling Asynchronous Functions

비동기 함수를 정의하기 위해서 `async` 키워드를 사용하여 함수를 정의합니다. 그리고 비동기 함수의 실행이 완료되어 반환할 때까지 기다리게 하는 키워드는 `await` 입니다. 이 두 키워드를 사용해서 비동기 함수를 정의하고 사용할 수 있습니다.

completion 클로저를 사용할 때 전달한 인자를 반환하는 방식으로 정의합니다.

```swift
// 비동기 함수는 인자 뒤, 반환값 앞에 async를 작성하여 선언합니다.
func listPhotos(inGallery name: String) async -> [String] {
    await Task.sleep(1 * 1_000_000_000)
    return ["IMG001", "IMG99", "IMG0404"]
}

// 동일한 비동기 함수입니다.
func downloadPhoto(named: String) async -> String {
    await Task.sleep(1 * 1_000_000_000)
    return named
}

// 비동기 함수는 특정 위치에서만 호출할 수 있습니다.
func process() async {
    // listPhotos 비동기 함수가 실행이 완료되어 반환할 때까지 대기합니다.
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    // 아래 두 라인은 동기적으로 실행됩니다.
    let sortedNames = photoNames.sorted()
    let name = sortedNames[1]
    // downloadPhoto 비동기 함수가 실행이 완료되어 반환할 때까지 대기합니다.
    let photo = await downloadPhoto(named: name)
    // 최종 결과를 출력하고 종료합니다.
    print(photo)
}
```

