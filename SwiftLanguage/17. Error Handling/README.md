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

### Propagating Errors Using Throwing Functions

### Handling Errors Using Do-Catch

### Converting Errors to Optional Values

### Disabling Error Propagation

## Specifying Cleanup Actions

