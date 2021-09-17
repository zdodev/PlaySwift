import RxSwift

var observer = Observable<Int>.just(1)
observer.subscribe { element in
    print(element)
}.dispose()
