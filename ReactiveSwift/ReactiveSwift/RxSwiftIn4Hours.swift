import Foundation
import RxSwift

class RxSwiftIn4Hours {
    private var counter = 0
    
    private let largeImageURL = "https://picsum.photos/1024/768/?random"
    private let largerImageURL = "https://picsum.photos/1280/720/?random"
    private let largestImageURL = "https://picsum.photos/2560/1440/?random"
    
    func viewDidLoad() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
            counter += 1
            print(counter)
        }
    }
    
    func onLoadImage() {
        _ = loadImageWithRxSwift(from: largestImageURL)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                switch result {
                case let .next(data):
                    if let data = data {
                        print(data)
                    }
                case let .error(error):
                    print(error)
                case .completed:
                    print("completed")
                }
            }
    }
    
    private func loadImageWithRxSwift(from imageURL: String) -> Observable<Data?> {
        return Observable.create { observer in
            self.asyncLoadImage(from: imageURL) { data in
                observer.onNext(data)
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    private func asyncLoadImage(from imageURL: String, completed: @escaping (Data?) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: self.largeImageURL) else {
                completed(nil)
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                completed(nil)
                return
            }
            
            completed(data)
        }
    }
}
