import Foundation
import Alamofire

enum APITypeError: Error {
    case invalidURL
}

protocol APIType {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var body: Encodable? { get }
}

extension APIType {
    func urlRequest(baseURL: String) throws -> URLRequest {
        do {
            return try URLRequest(
                url: baseURL + path,
                method: method,
                headers: headers
            )
            .map {
                guard let body = body else {
                    return $0
                }
                let anyEncodable = AnyEncodable(body)
                return try JSONParameterEncoder.default.encode(anyEncodable, into: $0)
            }
        } catch {
            throw error
        }
    }
}

extension URLRequest {
    func map(_ transform: (Self) throws -> Self) rethrows -> Self {
        var newURLRequest = self
        newURLRequest = try transform(self)
        return newURLRequest
    }
}

struct AnyEncodable: Encodable {
    private let encodable: Encodable
    
    init(_ encodable: Encodable) {
        self.encodable = encodable
    }
    
    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
