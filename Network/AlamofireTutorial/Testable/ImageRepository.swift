import Foundation
import Alamofire
import RxSwift

protocol ImageRepositoryProtocol: WebRepository {
    func loadImage() -> Observable<Data>
}

struct ImageRepository: ImageRepositoryProtocol {
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func loadImage() -> Observable<Data> {
        request(endpoint: API.image)
    }
}

extension ImageRepository {
    enum API {
        case image
    }
}

extension ImageRepository.API: APIType {
    var path: String {
        switch self {
        case .image:
            return "/photos/1257860/pexels-photo-1257860.jpeg?cs=srgb&dl=pexels-philippe-donn-1257860.jpg&fm=jpg"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .image:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    var body: Encodable? {
        switch self {
        case .image:
            return nil
        }
    }
}
