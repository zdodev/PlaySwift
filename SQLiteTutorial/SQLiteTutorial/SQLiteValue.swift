import Foundation
import SQLite3

public enum SQLiteValue: Sendable, Equatable {
    case integer(Int64)
    case double(Double)
    case text(String)
    case blob(Data)
    case null
}

extension SQLiteValue: CustomStringConvertible {
    public var description: String {
        switch self {
        case .integer(let value): return "\(value)"
        case .double(let value): return "\(value)"
        case .text(let value): return "\"\(value)\""
        case .blob(let data): return "Blob(\(data.count) bytes)"
        case .null: return "NULL"
        }
    }
}
