import Foundation
import RxSwift

struct SubjectT {
    private let disposeBag = DisposeBag()
    
    func subject1() {
        let subject = PublishSubject<String>()
       
        let observer = subject.asObserver()
        let observable = subject.asObservable()
        
        observable.subscribe(onNext: {
            print($0)
        })
            .disposed(by: disposeBag)
        
        observer.onNext("first")
        subject.onNext("second")
    }
}
