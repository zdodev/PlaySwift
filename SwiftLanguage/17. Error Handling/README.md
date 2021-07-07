# Error Handling

Swift의 모든 연산이 올바른 결과를 반환하는 것을 항상 보장하지 않습니다. 옵셔널이라는 기능을 사용하여 값의 유무를 쉽게 처리할 수 있지만 단순히 값이 없다는 것이 아니라, 작업이 실패했을 때 구체적으로 무엇을 실패했는지 알아내고 적절하게 처리하는 게 유용할 때가 있습니다.

디스크에서 파일 자료를 불러오는 작업에서 에러가 발생했을 때, 파일이 존재하지 않는지, 파일에 대한 읽기 권한이 없는지, 올바르지 않은 파일 포맷으로 읽는지에 대한 여러 가지 이유로 파일 불러오기를 실패할 수 있습니다. Swift의 에러 처리는 다양한 에러 상황을 구체적으로 정의하고 처리할 수 있도록 도와줍니다.

## Representing and Throwing Errors

Swift에서 에러를 정의할 때는 Error 프로토콜을 채택해야 합니다.

```swift
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

throws 키워드를 사용하여 상위 호출 코드로 에러를 전달할 수 있습니다.

```swift
// 함수를 호출한 코드로 에러 전달
func canThrowErrors() throws -> String {
    ""
}
```

throws 키워드를 사용한 함수만이 에러를 전달할 수 있습니다.

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
    
    // 에러를 전달하기 때문에 throws 키워드를 사용한다.
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            // 목록에 없는 항목이 주어지면 VendingMachineError.invalidSelection 에러 전달
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            // 재고가 없으면 VendingMachineError.outOfStock
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            // 물품 가격보다 현금이 적을 경우 VendingMachineError.insufficientFunds 에러를 전달한다.
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
    // 에러가 발생할 수 있는 메서드는 try 키워드를 사용하여 호출한다.
    // 에러 발생 시 메서드 호출 영역으로 에러가 전달된다. 위에 throws가 보이지 않는가?
    try vendingMachine.vend(itemNamed: snackName)
}
```

```swift
struct PurchasedSnack {
    let name: String
    
    // 이니셜라이저에서도 에러를 전달하는 식으로 처리하는 구문이다.
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
```

### Handling Errors Using Do-Catch

### Converting Errors to Optional Values

### Disabling Error Propagation

## Specifying Cleanup Actions

