import Foundation

struct T {
    let baseURL = "wss://pubwss.bithumb.com"
    let path = "/pub/ws"
    
    func f(_ completion: @escaping (Result<String, APIError>) -> Void) {
        let url = URL(string: baseURL + path)!
        let urlRequest = URLRequest(url: url)
        let urlSessionWebSocketTask = URLSession.shared.webSocketTask(with: urlRequest)
        urlSessionWebSocketTask.receive { result in
            switch result {
            case .success(let data):
                switch data {
                case .string(let string):
                    print("string: ", string)
                    completion(.success(string))
                default:
                    fatalError()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        urlSessionWebSocketTask.resume()
    }
}

let t = T()
t.f { result in
    switch result {
    case .success(let data):
        let stringData = data.data(using: .utf8)!
        guard let jsonData = try? JSONSerialization.jsonObject(with: stringData) as? Dictionary<String, Any> else {
            return
        }
        print(jsonData["status"], jsonData["resmsg"])
    case .failure(let error):
        print(error)
    }
}

let string = "{\"form_id\":3465,\"canonical_name\":\"df_SAWERQ\",\"form_name\":\"Activity 4 with Images\",\"form_desc\":null}"
let data = string.data(using: .utf8)!
do {
    if let jsonArray = try JSONSerialization.jsonObject(with: data) as? Dictionary<String,Any>
    {
        print(jsonArray) // use the json here
    } else {
        print("bad json")
    }
} catch let error as NSError {
    print(error)
}


RunLoop.main.run()
