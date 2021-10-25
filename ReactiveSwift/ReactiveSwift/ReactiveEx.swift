import Foundation
import RxSwift

final class ReactiveEx {
    private let disposeBag = DisposeBag()
    
    func just() {
        let observable = Observable.just(1)
        
        observable.subscribe { event in
            if let element = event.element {
                print(element)
            }
        }.disposed(by: disposeBag)
    }
    
    func interval() {
        let observer = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        
        observer.subscribe { element in
            print(element)
        }
    }
    
    func create() {
        let observer = Observable<Int>.create { element in
            element.onNext(10)
            element.onCompleted()
            return Disposables.create()
        }
        
        observer.subscribe { element in
            print(element)
        }
        .dispose()
    }
    
    func downloadJSONData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

        loadTitle(url: url)
            .observe(on: MainScheduler.instance)
            .subscribe { element in
                print(element)
            }
    }
    
    private func loadTitle(url: URL) -> Observable<String?> {
        let observable = Observable<String?>.create { streamElement in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data else {
                    streamElement.onNext(nil)
                    streamElement.onCompleted()
                    return
                }
                
                let decodedData = try? JSONDecoder().decode(JSONPlaceholder.self, from: data)
                
                streamElement.onNext(decodedData?.title)
                streamElement.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
        
        return observable
    }
    
    func publishSubject() {
        let subject = PublishSubject<String>()
        subject.onNext("Is anyone listening?")
        // No
        
        let subscription1 = subject.subscribe { event in
            print("first \(event)")
        }
        
        subject.onNext("1234")
        subject.onNext("2345")
        
        let subscription2 = subject.subscribe { event in
            print("second \(event)")
        }
        
        subject.onNext("3456")
        subject.onNext("4567")
        subject.onCompleted()
        subject.dispose()

        subject.onNext("no")
    }
}

struct JSONPlaceholder: Decodable {
    let title: String
}
