import Foundation

let reactive = ReactiveEx()
//reactive.just()
//reactive.interval()
reactive.create()
//reactive.downloadJSONData()
//reactive.publishSubject()

let syncAsync = SyncAsync()
//syncAsync.viewDidLoad()
//syncAsync.onLoadSync()
//syncAsync.onLoadAsync()

let rxSwift4Hours = RxSwiftIn4Hours()
//rxSwift4Hours.viewDidLoad()
//rxSwift4Hours.onLoadImage()

let subjectT = SubjectT()
subjectT.subject1()

RunLoop.main.run()

