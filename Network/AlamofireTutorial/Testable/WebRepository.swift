import Foundation
import Alamofire
import RxSwift

protocol WebRepository {
    var baseURL: String { get }
}

extension WebRepository {
    func request<Value>(endpoint: APIType) -> Observable<Value> where Value: Decodable {
        Observable.create { observer in
            do {
                let urlRequest = try endpoint.urlRequest(baseURL: baseURL)
                let request = AF.request(urlRequest)
                    .validate()
                    .responseDecodable(of: Value.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.on(.next(value))
                            observer.onCompleted()
                        case .failure(let error):
                            observer.on(.error(error))
                        }
                    }
                
                return Disposables.create {
                    request.cancel()
                }
            } catch {
                observer.on(.error(error))
                return Disposables.create()
            }
        }
    }
    
    func request(endpoint: APIType) -> Observable<Data> {
        Observable.create { observer in
            do {
                let urlRequest = try endpoint.urlRequest(baseURL: baseURL)
                let request = AF.request(urlRequest)
                    .validate()
                    .responseData { reponse in
                        switch reponse.result {
                        case .success(let data):
                            observer.on(.next(data))
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
                return Disposables.create {
                    request.cancel()
                }
            } catch {
                observer.on(.error(error))
                return Disposables.create()
            }
        }
    }
}
