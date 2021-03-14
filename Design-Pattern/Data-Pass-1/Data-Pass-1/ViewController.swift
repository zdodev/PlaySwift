import UIKit

class ViewController: UIViewController {
//    private let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // 1. Callback as completion handler
        dataModel.requestData1 { [weak self] data in
            self?.useData(data: data)
        }
        
        // 2. Callback as a class property
        dataModel.onDataUpdate = { [weak self] data in
            self?.useData(data: data)
        }
        dataModel.requestData2()
        */
        
        /*
        dataModel.delegate = self
        dataModel.requestData()
        */
        
        NotificationCenter.default.addObserver(self, selector: #selector(getDataUpdate), name: NSNotification.Name(rawValue: dataModelDidUpdateNotification), object: nil)
        
        DataModel.sharedInstance.requestData()
    }
    
    @objc private func getDataUpdate() {
        if let data = DataModel.sharedInstance.data {
            useData(data: data)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: dataModelDidUpdateNotification), object: self)
    }
    
    private func useData(data: String) {
        print(data)
    }
}

/*
extension ViewController: DataModelDelegate {
    func didReceiveDataUpdate(data: String) {
        useData(data: data)
    }
}
*/

/*
class DataModel {
    var onDataUpdate: ((_ data: String) -> Void)?
    
    // 1. Callback as completion handler
    func requestData1(completion: ((_ data: String) -> Void)) {
        // The data was received and parsed to String
        let data = "Data from wherever"
        completion(data)
    }
    
    // 2. Callback as a class property
    func requestData2() {
        // The data was received and parsed to String
        let data = "Data from wherever"
        onDataUpdate?(data)
    }
}
*/

/*
protocol DataModelDelegate: class {
    func didReceiveDataUpdate(data: String)
}

class DataModel {
    weak var delegate: DataModelDelegate?
    
    func requestData() {
        // The data was received and parsed to String
        let data = "Data from wherever"
        delegate?.didReceiveDataUpdate(data: data)
    }
}
*/

final class DataModel {
    static var sharedInstance = DataModel()
    private(set) var data: String? {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: dataModelDidUpdateNotification), object: nil)
        }
    }
    
    private init() {}
    
    func requestData() {
        data = "Data from wherever"
    }
}

let dataModelDidUpdateNotification = "dataModelDidUpdateNotification"
