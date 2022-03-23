import Foundation
import Moya

struct Repository {
    private let provider = MoyaProvider<JSONPlacerholderService>(callbackQueue: .global())
    
    func read() {
        provider.request(.read) { result in
            switch result {
            case let .success(response):
                let data = response.data
                let decodedData = try! JSONDecoder().decode([Post].self, from: data)
                print(decodedData)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func write() {
        provider.request(.write) { result in
            switch result {
            case let .success(response):
                let data = response.data
                let decodedData = try! JSONDecoder().decode(Post.self, from: data)
                print(decodedData)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func update() {
        provider.request(.update) { result in
            switch result {
            case let .success(response):
                let data = response.data
                let decodedData = try! JSONDecoder().decode(Post.self, from: data)
                print(decodedData)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func patch() {
        provider.request(.update) { result in
            switch result {
            case let .success(response):
                let data = response.data
                let decodedData = try! JSONDecoder().decode(Post.self, from: data)
                print(decodedData)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func delete() {
        provider.request(.delete) { result in
            switch result {
            case let .success(response):
                let data = response.data
                print(data)
            case let .failure(error):
                print(error)
            }
        }
    }
}

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
