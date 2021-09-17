import Foundation
import RxSwift

struct ReactiveEx {
    func just() {
        let observer = Observable<Int>.just(1)
        
        observer.subscribe { element in
            print(element)
        }.dispose()
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
}

struct JSONPlaceholder: Decodable {
    let title: String
}
