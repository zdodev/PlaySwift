import Foundation
import SQLite3

public actor SQLiteDatabase {
    private var db: OpaquePointer?
    private let path: String

    public init(path: String) async throws {
        self.path = path
        try open()
    }

    isolated deinit {
        if db != nil {
            sqlite3_close(db)
        }
    }

    private func open() throws {
        if sqlite3_open(path, &db) != SQLITE_OK {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            throw SQLiteError.openFailed(message: errorMsg)
        }
    }
    
    public func close() {
        if db != nil {
            sqlite3_close(db)
            db = nil
        }
    }
    
    public func execute(_ sql: String, arguments: [SQLiteValue] = []) throws {
        let statement = try SQLiteStatement(db: db, query: sql)
        try statement.bind(arguments: arguments)
        while try statement.step() { }
    }
    
    public func query(_ sql: String, arguments: [SQLiteValue] = []) throws -> [[String: SQLiteValue]] {
        let statement = try SQLiteStatement(db: db, query: sql)
        try statement.bind(arguments: arguments)
        
        var rows: [[String: SQLiteValue]] = []
        let columnCount = statement.columnCount
        
        while try statement.step() {
            var row: [String: SQLiteValue] = [:]
            for i in 0..<columnCount {
                let name = statement.getColumnName(index: i)
                let value = statement.getColumnValue(index: i)
                row[name] = value
            }
            rows.append(row)
        }
        
        return rows
    }
}
