import Foundation
import Combine

struct JSONPlaceholderWebRepositoryServer: JSONPlaceholderWebRepository {
    let session: URLSession
    let baseURL: String
    
    init(session: URLSession = .shared, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func loadOneMemo() -> AnyPublisher<Memo, Error> {
        call(endpoint: API.oneMemo)
    }
    
    func loadAllMemos() -> AnyPublisher<[Memo], Error> {
        call(endpoint: API.allMemo)
    }
}

extension JSONPlaceholderWebRepositoryServer {
    enum API {
        case oneMemo
        case allMemo
    }
}

extension JSONPlaceholderWebRepositoryServer.API: APILayer {
    var path: String {
        switch self {
        case .oneMemo:
            return "/posts/1"
        case .allMemo:
            return "/posts"
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var headers: HTTPHeader? {
        ["Accept": "application/json"]
    }
    
    func body() throws -> Data? {
        nil
    }
}
