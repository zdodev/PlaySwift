import Foundation
import Combine

let baseURL = "https://jsonplaceholder.typicode.com"

struct Main {
    private var cancellables = Set<AnyCancellable>()
    private let repository = JSONPlaceholderWebRepositoryServer(baseURL: baseURL)
    
    mutating func main() {
        loadOneMemo()
//        loadAllMemo()
    }
    
    mutating func loadOneMemo() {
        repository.loadOneMemo()
            .sink { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { value in
                print(value)
            }
            .store(in: &cancellables)
    }
    
    mutating func loadAllMemo() {
        repository.loadAllMemos()
            .sink { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { value in
                print(value)
            }
            .store(in: &cancellables)
    }
}

var main = Main()
main.main()

RunLoop.main.run()
