import UIKit

class ViewController: UIViewController {
    private let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.requestData { [weak self] data in
            self?.useData(data: data)
        }
    }
    
    private func useData(data: String) {
        print(data)
    }
}

class DataModel {
    func requestData(completion: ((_ data: String) -> Void)) {
        // the data was received and parsed to String
        let data = "Data from wherever"
        completion(data)
    }
}
