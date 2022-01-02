import Foundation
import Combine

struct Main {
    private var cancellables = Set<AnyCancellable>()
    private let myNotification = Notification.Name("myNoti")
    
    mutating func main() {
        performAsyncActionAsFuture()
            .sink(receiveValue: {
                print($0)
            })
            .store(in: &cancellables)
        
        performAsyncActionAsJust()
            .sink {
                print($0)
            }
            .store(in: &cancellables)
        
        performAsyncActionAsFureWithParameter()
            .sink {
                print($0)
            }
            .store(in: &cancellables)
        
        combineNotification()
            .sink { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { value in
                print(value)
                print("success notification")
            }
            .store(in: &cancellables)

        postNotification()
    }
    
    func performAsyncAction(completionHandler: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler()
        }
    }
    
    func performAsyncActionAsFuture() -> Future<Int, Never> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(Result.success(1))
            }
        }
    }
    
    func performAsyncActionAsJust() -> Just<Int> {
        Just(5)
    }
    
    func performAsyncActionAsFureWithParameter() -> Future<Int, Never> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(.success(Int.random(in: 1...10)))
            }
        }
    }
    
    func combineNotification() -> some Publisher {
        NotificationCenter.default.publisher(for: .myNotification, object: nil)
    }
    
    func postNotification() {
        NotificationCenter.default.post(name: .myNotification, object: nil)
    }
}

var main = Main()
main.main()

extension NSNotification.Name {
    static let myNotification = Notification.Name("myNotification")
}

RunLoop.main.run()
