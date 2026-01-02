import Foundation
import SQLite3

class SQLiteStatement {
    private var stmt: OpaquePointer?
    private let query: String
    private let db: OpaquePointer?

    init(db: OpaquePointer?, query: String) throws {
        self.db = db
        self.query = query
        try prepare()
    }

    deinit {
        finalize()
    }

    private func prepare() throws {
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) != SQLITE_OK {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            throw SQLiteError.prepareFailed(message: errorMsg)
        }
    }
    
    func bind(arguments: [SQLiteValue]) throws {
        for (index, value) in arguments.enumerated() {
            let parameterIndex = Int32(index + 1)
            let result: Int32
            
            switch value {
            case .integer(let intValue):
                result = sqlite3_bind_int64(stmt, parameterIndex, intValue)
            case .double(let doubleValue):
                result = sqlite3_bind_double(stmt, parameterIndex, doubleValue)
            case .text(let stringValue):
                result = sqlite3_bind_text(stmt, parameterIndex, stringValue, -1, SQLITE_TRANSIENT)
            case .blob(let dataValue):
                result = dataValue.withUnsafeBytes { buffer in
                    sqlite3_bind_blob(stmt, parameterIndex, buffer.baseAddress, Int32(dataValue.count), SQLITE_TRANSIENT)
                }
            case .null:
                result = sqlite3_bind_null(stmt, parameterIndex)
            }
            
            if result != SQLITE_OK {
                 let errorMsg = String(cString: sqlite3_errmsg(db))
                throw SQLiteError.bindFailed(message: errorMsg)
            }
        }
    }
    
    func step() throws -> Bool {
        let result = sqlite3_step(stmt)
        switch result {
        case SQLITE_ROW:
            return true
        case SQLITE_DONE:
            return false
        default:
             let errorMsg = String(cString: sqlite3_errmsg(db))
            throw SQLiteError.stepFailed(message: errorMsg)
        }
    }
    
    func finalize() {
        if stmt != nil {
            sqlite3_finalize(stmt)
            stmt = nil
        }
    }
    
   func getColumnValue(index: Int32) -> SQLiteValue {
       let type = sqlite3_column_type(stmt, index)
       switch type {
       case SQLITE_INTEGER:
           return .integer(sqlite3_column_int64(stmt, index))
       case SQLITE_FLOAT:
           return .double(sqlite3_column_double(stmt, index))
       case SQLITE_TEXT:
           let text = String(cString: sqlite3_column_text(stmt, index))
           return .text(text)
       case SQLITE_BLOB:
           let data = sqlite3_column_blob(stmt, index)
           let size = sqlite3_column_bytes(stmt, index)
           if let data = data {
               return .blob(Data(bytes: data, count: Int(size)))
           } else {
               return .blob(Data())
           }
       case SQLITE_NULL:
           return .null
       default:
           return .null
       }
   }
   
   func getColumnName(index: Int32) -> String {
       return String(cString: sqlite3_column_name(stmt, index))
   }
   
   var columnCount: Int32 {
       return sqlite3_column_count(stmt)
   }
}

let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
