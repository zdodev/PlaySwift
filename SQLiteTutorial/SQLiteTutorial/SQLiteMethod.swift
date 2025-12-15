import Foundation
import SQLite3

// MARK: - sqlite3_open_v2
// SQLite 데이터베이스 파일 연결 및 생성

/*
 int sqlite3_open_v2(
    const char *filename, // 데이터베이스 파일 이름 (UTF-8)
    sqlite **ppDb,        // 데이터베이스 핸들이 저장될 포인터
    int flags,            // 열기 옵션 플래그
    const char *zVfs      // 사용할 VFS 모듈 이름
 )
 
 func sqlite3_open_v2(
    _ filename: UnsafePointer<CChar>!,
    _ ppDb: UnsafeMutablePointer<OpaquePointer?>!,
    _ flags: Int32, _ zVfs: UnsafePointer<CChar>!
 ) -> Int32
 */

// MARK: - sqlite3_prepare_v2
// SQL 문자열을 SQLite 엔진이 실행할 수 있는 바이트코드로 컴파일

/*
 int sqlite3_prepare_v2(
    sqlite3 *db,           // 데이터베이스 핸들
    const char *zSql,      // SQL 쿼리문 (UTF-8)
    int nByte,             // zSql의 바이트 길이
    sqlite3_stmt **ppStmt, // 컴파일된 Statement 핸들
    const char *pzTail    // 사용되지 않은 나머지 SQL 부분
 )
 
 func sqlite3_prepare_v2(
    _ db: OpaquePointer!,
    _ zSql: UnsafePointer<CChar>!,
    _ nByte: Int32,
    _ ppStmt: UnsafeMutablePointer<OpaquePointer?>!,
    _ pzTail: UnsafeMutablePointer<UnsafePointer<CChar>?>!
 ) -> Int32
 */

// MARK: - sqlite3_bind_text
// 준비된 쿼리문(Prepared Statement)의 파라미터에 실제 문자열 데이터를 주입

/*
 int sqlite3_bind_text(
    sqlite3_stmt*,
    int,
    const char*,
    int,
    void(*)(void*)
 );
 
 func sqlite3_bind_text(
    _: OpaquePointer!,
    _: Int32,
    _: UnsafePointer<CChar>!,
    _: Int32,
    _: (@convention(c) (UnsafeMutableRawPointer?) -> Void)!
 ) -> Int32
 */

// MARK: - sqlite3_step
// Prepared Statement를 실제로 실행

/*
 int sqlite3_step(sqlite3_stmt*);
 
 func sqlite3_step(_: OpaquePointer!) -> Int32
 
 SQLITE_DONE (101)
 - 더 이상 읽을 데이터가 없거나, 명령이 성공적으로 완료됨.
 - INSERT, UPDATE, DELETE 문에서는 성공을 의미.
 - SELECT 문에서는 모든 데이터를 다 읽었음을 의미.
 
 SQLITE_ROW (100)
 - 데이터 한 줄을 성공적으로 읽어왔음.
 - SELECT 문에서만 발생하며, 데이터를 꺼낸 후 다시 step을 호출해야 다음 줄로 넘어간다.
 */

// MARK: - sqlite3_column_text
// SELECT 쿼리 실행 결과에서 특정 컬럼의 문자열 데이터를 가져옴

/*
 const unsigned char *sqlite3_column_text(
    sqlite3_stmt*,
    int iCol
 );
 
 func sqlite3_column_text(
    _: OpaquePointer!,
    _ iCol: Int32
 ) -> UnsafePointer<UInt8>!
 */

// MARK: - sqlite3_finalize
// Prepared Statement를 메모리에서 제거

/*
 int sqlite3_finalize(sqlite3_stmt *pStmt);
 
 func sqlite3_finalize(_ pStmt: OpaquePointer!) -> Int32
 */

// MARK: - sqlite3_close_v2
// 데이터베이스 연결을 종료

/*
 int sqlite3_close_v2(sqlite3*);
 
 public func sqlite3_close_v2(_: OpaquePointer!) -> Int32
 */

class SQLiteDatabase {
    static func open(path: String) throws -> OpaquePointer {
        var dbPointer: OpaquePointer?

        let flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE | SQLITE_OPEN_FULLMUTEX
        
        if sqlite3_open_v2(
            path,
            &dbPointer,
            flags,
            nil
        ) == SQLITE_OK {
            return dbPointer!
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
            sqlite3_close_v2(dbPointer)
            throw SQLiteError.sqliteFailed(message: errorMessage)
        }
    }
    
    static func prepare(dbPointer: OpaquePointer, sql: String) throws -> OpaquePointer {
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(
            dbPointer,
            sql,
            -1,
            &statement,
            nil
        ) == SQLITE_OK {
            return statement!
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
            throw SQLiteError.sqliteFailed(message: errorMessage)
        }
    }
    
    static let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    
    static func bind(statement: OpaquePointer, index: Int32, value: String) throws {
        let bindResult = sqlite3_bind_text(
            statement,
            index,
            value,
            -1,
            SQLITE_TRANSIENT
        )
        
        if bindResult != SQLITE_OK {
            if let errorCString = sqlite3_errstr(bindResult) {
                throw SQLiteError.sqliteFailed(message: String(cString: errorCString))
            }
        }
    }
    
    static func step(statement: OpaquePointer) throws {
        let stepResult = sqlite3_step(statement)
        
        if stepResult != SQLITE_DONE && stepResult != SQLITE_ROW {
            if let errorCString = sqlite3_errstr(stepResult) {
                throw SQLiteError.sqliteFailed(message: String(cString: errorCString))
            }
        }
    }
    
    static func column(statement: OpaquePointer, index: Int32) -> String {
        String(cString: sqlite3_column_text(
            statement,
            index
        ))
    }
    
    static func finalize(statement: OpaquePointer) {
        sqlite3_finalize(statement)
    }
    
    static func close(dbPointer: OpaquePointer) {
        sqlite3_close_v2(dbPointer)
    }
}
