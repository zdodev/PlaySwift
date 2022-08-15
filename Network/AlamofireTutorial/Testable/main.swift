import Foundation
import RxSwift

let disposeBag = DisposeBag()

for index in 1...10 {
    let p = PostRepository(baseURL: "https://jsonplaceholder.typicode.com")
    p.loadPost()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)

    let i = ImageRepository(baseURL: "https://images.pexels.com")
    i.loadImage()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    print(index)
}

RunLoop.main.run()
