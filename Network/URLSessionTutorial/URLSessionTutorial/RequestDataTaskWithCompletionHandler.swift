import Foundation

protocol APICall {
    var path: String { get }
}

extension APICall {
    func urlRequest(baseURL: String) -> URLRequest? {
        guard let url = URL(string: baseURL + path) else {
            return nil
        }
        
        return URLRequest(url: url)
    }
}


protocol RepositoryProtocol {
    var baseURL: String { get }
}

enum APIError: Error {
    case error
}

extension RepositoryProtocol {
    func request<T>(endpoint: APICall, decodableType: T.Type, _ completion: @escaping (Result<T, APIError>) -> Void) where T: Decodable {
        guard let urlRequest = endpoint.urlRequest(baseURL: baseURL) else {
            completion(.failure(.error))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            guard error == nil else {
                completion(.failure(.error))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error))
                return
            }

            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.error))
                return
            }
            
            completion(.success(decodedData))
        }.resume()
    }
}

protocol JSONPlaceholderRepository: RepositoryProtocol {
    func requestPost(_ completion: @escaping (Result<PostModel, APIError>) -> Void)
}

struct JSONPlaceholderService: JSONPlaceholderRepository {
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    func requestPost(_ completion: @escaping (Result<PostModel, APIError>) -> Void) {
        request(endpoint: API.requestPost, decodableType: PostModel.self) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension JSONPlaceholderService {
    enum API {
        case requestPost
    }
}

extension JSONPlaceholderService.API: APICall {
    var path: String {
        switch self {
        case .requestPost:
            return "/posts/1"
        }
    }
}

struct PostModel: Decodable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case body
    }
}

//let jsonPlaceholderService = JSONPlaceholderService()
//jsonPlaceholderService.requestPost { result in
//    switch result {
//    case .success(let value):
//        print(value)
//    case .failure(let error):
//        print(error)
//    }
//}
//
//RunLoop.main.run()
