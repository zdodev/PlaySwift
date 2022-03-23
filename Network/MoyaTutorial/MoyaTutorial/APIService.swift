import Foundation
import Moya

enum JSONPlacerholderService {
    case read
    case write
    case update
    case patch
    case delete
}

extension JSONPlacerholderService: TargetType {
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .read, .write:
            return "/posts"
        case .update, .patch, .delete:
            return "/posts/1"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .read:
            return .get
        case .write:
            return .post
        case .update:
            return .put
        case .patch:
            return .patch
        case .delete:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .read:
            return .requestPlain
        case .write:
            return .requestParameters(
                parameters: [
                    "title": "foo",
                    "body": "bar",
                    "userId": 1
                ],
                encoding: JSONEncoding.default
            )
        case .update:
            return .requestParameters(
                parameters: [
                    "title": "swift",
                    "body": "bar",
                    "userId": 1,
                    "id": 1
                ],
                encoding: JSONEncoding.default
            )
        case .patch:
            return .requestParameters(
                parameters: [
                    "title": "foo"
                ],
                encoding: JSONEncoding.default
            )
        case .delete:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}
