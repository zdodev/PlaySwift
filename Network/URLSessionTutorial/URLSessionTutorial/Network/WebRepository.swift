import Foundation

fileprivate let jsonDecoder = JSONDecoder()

protocol WebRepository {
    var baseURL: String { get }
}

extension WebRepository {
    func request<Value>(_ endpoint: URLElement) async throws -> Value where Value: Decodable {
        let urlRequest = try endpoint.urlRequest(baseURL: baseURL)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        return try jsonDecoder.decode(
            Value.self,
            from: data
        )
    }
}
