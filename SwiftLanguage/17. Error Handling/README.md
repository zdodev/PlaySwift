# Error Handling

- 에러 타입 정의, Error
- 에러 발생
    - throws
    - throw
- 에러 핸들링
    - do-catch
    - try
    - try?
    - try!

Swift의 모든 연산이 올바른 결과를 반환하는 것을 항상 보장하지 않습니다. 옵셔널이라는 기능을 사용하여 값의 유무를 쉽게 처리할 수 있지만 단순히 값이 없다는 것이 아니라, 작업이 실패했을 때 구체적으로 무엇을 실패했는지 알아내고 적절하게 처리하는 게 유용할 때가 있습니다.

디스크에서 파일 자료를 불러오는 작업에서 에러가 발생했을 때, 파일이 존재하지 않는지, 파일에 대한 읽기 권한이 없는지, 올바르지 않은 파일 포맷으로 읽는지에 대한 여러 가지 이유로 파일 불러오기를 실패할 수 있습니다. Swift의 에러 처리는 다양한 에러 상황을 구체적으로 정의하고 처리할 수 있도록 도와줍니다.

## Representing and Throwing Errors

Swift에서 에러를 정의할 때는 Error 프로토콜을 채택해야 합니다.

```swift
// 에러 타입 정의
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// 에러를 발생시키기 위해서는 throw 키워드를 사용합니다.
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

## Handling Errors

에러가 발생할 때, 반드시 이 에러를 처리할 수 있는 코드가 에러 발생 코드 주변에 있어야 합니다.

- 에러를 전달하여 처리
- do-catch 문으로 처리
- 에러 옵셔널 처리
- assert

### Propagating Errors Using Throwing Functions

`throws` 키워드를 사용하여 상위 호출 코드로 에러를 전달할 수 있습니다.

```swift
// 함수를 호출한 코드로 에러 전달
func canThrowErrors() throws -> String {
    ""
}
```

`throws` 키워드를 사용한 함수만이 에러를 전달할 수 있습니다.

```swift
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    var coinsDeposited = 0
    
    // 에러를 전달하기 때문에 throws 키워드를 사용합니다.
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            // 목록에 없는 항목이 주어지면 VendingMachineError.invalidSelection 에러 전달
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            // 재고가 없으면 VendingMachineError.outOfStock 에러 전달
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            // 물품 가격보다 현금이 적을 경우 VendingMachineError.insufficientFunds 에러 전달
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
```

에러가 발생할 수 있는 코드를 호출할 경우 try?, try!, do-catch, throws와 같은 방법을 통해서 에러를 처리 또는 전달해야 합니다.

```swift
let favoriteSnaks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

// 에러 전달 메서드
func buyFavoriteSnake(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnaks[person] ?? "Candy Bar"
    // 에러가 발생할 수 있는 메서드는 try 키워드를 사용하여 호출합니다.
    // 에러 발생 시 메서드 호출 영역으로 에러가 전달됩니다. 
    try vendingMachine.vend(itemNamed: snackName)
}
```



```swift
struct PurchasedSnack {
    let name: String
    
    // 이니셜라이저에서도 에러를 전달하는 식으로 처리하는 구문입니다.
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
```

### Handling Errors Using Do-Catch

발생한 에러를 처리할 때 do-catch 문을 사용할 수 있습니다. 에러가 발생할 수 있는 구문을 do 괄호안에서 try 키워드와 함께 호출합니다. 에러가 발생하지 않으면 그대로 이어서 실행합니다. 에러가 발생하면 catch 문이 실행됩니다. 발생한 에러에 대한 catch 문이 실행되고 이어서 실행합니다.

```swift
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

// do 구문
do {
    // 에러가 발생할 수 있는 코드는 try 키워드를 사용하여 호출합니다.
    try buyFavoriteSnake(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
// VendingMachineError.invalidSelection 에러 발생 시 실행될 catch 문
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error)")
}
```

꼭 VendingMachineError가 아니더라도 모든 에러를 상위 코드에서 처리할 수 있도록 구현할 수 있습니다. nourish 함수에서는 VendingMachineError 에러에 관한 모든 에러를 처리하며, 나머지 에러는 상위로 전달됩니다. 상위에서는 단순히 catch만 명시하여 모든 에러를 처리합니다.

```swift
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    // 모든 VendingMachineError 에러 처리
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
// nourish() 메서드에서 처리되지 않은 모든 에러 처리
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
```

catch문에 에러를 나열하여 선언할 수도 있습니다.

```swift
func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    // 에러 나열
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}
```

### Converting Errors to Optional Values

발생한 에러를 옵셔널로 처리할 수 있는 방법이 있습니다. try? 키워드를 사용하여 에러가 발생하지 않으면 정상적인 값을 반환하고, 에러가 발생하면 nil을 반환하도록 합니다. 이 함수의 반환값은 옵셔널입니다.

```swift
func someThrowingFunction() throws -> Int {
    1
}

// 에러 옵셔널 처리 구문
// 아래의 에러 처리 구문과 동일합니다.
let x = try? someThrowingFunction()

// do-catch문을 사용하여 옵셔널 처리하는 구문
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
```

이러한 문법은 에러를 간결하게 처리할 때 유용합니다.

```swift
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
```

### Disabling Error Propagation

옵셔널 강제 추출처럼 실행 시간에 에러가 발생하지 않는다고 확신할 때 사용하는 구문이 있습니다. try! 키워드를 사용하면 에러를 전파하지 않고 에러가 발생하지 않는다는 가정으로 에러 함수를 호출합니다. 만약에 try! 키워드를 사용하여 에러가 발생하면 런타임 에러가 발생합니다.

```swift
// 이미지 불러오기 함수 호출
// 이미지가 해당 경로에 있을 것이라는 보장이 있으면 try! 구문을 사용하여 에러를 처리합니다.
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
```

## Specifying Cleanup Actions

현재 코드 블럭이 종료되고 실행해야할 구문을 작성할 수 있습니다. `defer` 키워드를 사용하면 에러, break, return과 관계없이 해당 블럭을 벗어나면 실행합니다.

```swift
func processFile(filename: String) throws {
    if exists(filename) {
        // 파일을 엽니다.
        let file = open(filename)
        // 블럭 종료 후 파일을 닫습니다.
        defer {
            close(file)
        }
        while let line = try file.readline() {
            //
        }
        //
    }
}
```

