import Foundation

extension OpenAIService {
    
    enum ServiceError: Error {
        case uploadFailed
        case describeFailed
        case pollFailed
        case messagesFailed
    }
    
}

// MARK: `LocalizedError`

extension OpenAIService.ServiceError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .uploadFailed: "Failed to upload image"
        case .describeFailed: "Failed to start thread to describe image"
        case .pollFailed: "Failed to poll for response"
        case .messagesFailed: "Failed to get response message"
        }
    }
    
}
