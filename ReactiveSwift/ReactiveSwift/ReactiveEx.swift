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
    
    func downloadImage() {
        let url = URL(string: "https://images.pexels.com/photos/3052361/pexels-photo-3052361.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")!

        loadImage(url: url)
            .observe(on: MainScheduler.instance)
            .subscribe { element in
                print(element)
            }
    }
    
    private func loadImage(url: URL) -> Observable<Data?> {
        let observable = Observable<Data?>.create { streamElement in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data else {
                    streamElement.onNext(nil)
                    streamElement.onCompleted()
                    return
                }
                
                streamElement.onNext(data)
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
