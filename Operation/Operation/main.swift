import Foundation

func printIndex(character: String) {
    for index in 1...10 {
        print("\(index)... \(character)")
    }
}

/// BlockOperation 예시

let blockOperation = BlockOperation()
blockOperation.addExecutionBlock {
    printIndex(character: "😎")
}

blockOperation.addExecutionBlock {
    printIndex(character: "🤬")
}

//blockOperation.start()
//blockOperation.waitUntilFinished()

/// OperationQueue 예시

let operationQueue = OperationQueue()
operationQueue.maxConcurrentOperationCount = 3
//operationQueue.addOperation {
//    printIndex(character: "👻")
//}
//operationQueue.addOperation {
//    printIndex(character: "🍔")
//}
operationQueue.waitUntilAllOperationsAreFinished()
