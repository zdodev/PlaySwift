import Foundation

public enum SQLiteError: Error, Sendable {
    case openFailed(message: String)
    case prepareFailed(message: String)
    case execFailed(message: String)
    case bindFailed(message: String)
    case stepFailed(message: String)
    case unknown(message: String)
}
