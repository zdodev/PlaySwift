import Foundation
import Alamofire
import RxSwift

protocol PostRepositoryProtocol: WebRepository {
    func loadPost() -> Observable<Post>
    func loadPosts() -> Observable<Post>
}

struct PostRepository: PostRepositoryProtocol {
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func loadPost() -> Observable<Post> {
        request(endpoint: API.onePost)
    }
    
    func loadPosts() -> Observable<Post> {
        request(endpoint: API.posts)
    }
}

extension PostRepository {
    enum API {
        case onePost
        case posts
    }
}

extension PostRepository.API: APIType {
    var path: String {
        switch self {
        case .onePost:
            return "/posts/1"
        case .posts:
            return "/posts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .onePost:
            return .get
        case .posts:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    var body: Encodable? {
        switch self {
        case .onePost:
            return nil
        case .posts:
            let a = Post(userID: 1, id: 1, title: "a", body: "a")
            return a
        }
    }
}
