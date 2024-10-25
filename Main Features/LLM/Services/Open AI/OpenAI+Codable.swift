import Foundation

struct File: Codable {
    let id: String
}

struct Run: Codable {
    let id: String
    let thread_id: String
    let status: String
}

struct Messages: Codable {
    let data: [Message]
}

struct Message: Codable {
    let content: [Content]
}

struct Content: Codable {
    let text: TextContent?
}

struct TextContent: Codable {
    let value: String
}
