import Foundation
import RxSwift

let reactive = ReactiveEx()

reactive.just()
//reactive.interval()
reactive.create()
reactive.downloadJSONData()

RunLoop.main.run()
