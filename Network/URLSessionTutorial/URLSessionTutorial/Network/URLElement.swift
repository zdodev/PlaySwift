import Foundation

enum NetworkError: Error {
    case invalidURL
}

protocol URLElement {
    var method: String? { get }
    var path: String? { get }
    var queries: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

extension URLElement {
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard var url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        url.append(path: path ?? "")
        url.append(queryItems: queries ?? [])
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = body
        return urlRequest
    }
}
