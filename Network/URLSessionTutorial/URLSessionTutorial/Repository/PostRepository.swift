import Foundation

protocol PostRepositoryProtocol: WebRepository {
    func fetchPost(id: Int) async throws -> Post
}

final class PostRepository: PostRepositoryProtocol {
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    func fetchPost(id: Int) async throws -> Post {
        try await request(API.fetchPost(id))
    }
}

extension PostRepository {
    enum API {
        case fetchPost(Int)
    }
}

extension PostRepository.API: URLElement {
    var method: String? {
        nil
    }
    
    var path: String? {
        switch self {
        case .fetchPost(let page):
            "/posts/\(page)"
        }
    }
    
    var queries: [URLQueryItem]? {
        nil
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var body: Data? {
        nil
    }
}
