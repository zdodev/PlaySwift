import Foundation

let dbPath = "test.db"
// Remove existing db if any
if FileManager.default.fileExists(atPath: dbPath) {
    try? FileManager.default.removeItem(atPath: dbPath)
}

do {
    print("Opening Database...")
    let db = try await SQLiteDatabase(path: dbPath)
    
    print("Creating Table...")
    try await db.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            age INTEGER,
            score REAL
        );
    """)
    
    print("Inserting Data...")
    try await db.execute("INSERT INTO users (name, age, score) VALUES (?, ?, ?);", arguments: [.text("Alice"), .integer(30), .double(95.5)])
    try await db.execute("INSERT INTO users (name, age, score) VALUES (?, ?, ?);", arguments: [.text("Bob"), .integer(25), .double(88.0)])
    try await db.execute("INSERT INTO users (name, age, score) VALUES (?, ?, ?);", arguments: [.text("Charlie"), .null, .double(12.5)])

    print("Querying Data...")
    let users = try await db.query("SELECT * FROM users;")
    
    for user in users {
        print("User: \(user)")
    }
    
    print("Done.")
} catch {
    print("An error occurred: \(error)")
}
