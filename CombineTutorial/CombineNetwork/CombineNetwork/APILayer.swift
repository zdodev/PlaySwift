import Foundation

protocol APILayer {
    var path: String { get }
    var method: String { get }
    var headers: HTTPHeader? { get }
    
    func body() throws -> Data?
}

extension APILayer {
    func urlRequest(baseURL: String) throws -> URLRequest {
        let fullPath = baseURL + path
        guard let url = URL(string: fullPath) else {
            throw APIError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = try body()
        return urlRequest
    }
}

enum APIError: Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedReponse
}

typealias HTTPHeader = [String: String]
typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

extension HTTPCodes {
    static let success = 200..<300
}
