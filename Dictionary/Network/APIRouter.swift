import Foundation

protocol APIRouterType {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var method: String { get }
}


enum APIRequestError: Error {
    case badUrl
    case noData
    case requestFailed(description: String)
}
