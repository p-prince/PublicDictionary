import Foundation

import Foundation

protocol APIRequestDispatcherProtocol {
    func request<T: Codable>(apiRouter: APIRouterType) async throws -> T
}

class APIRequestDispatcher: APIRequestDispatcherProtocol {

    func request<T: Codable>(apiRouter: APIRouterType) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path

        guard let url = components.url else { throw APIRequestError.badUrl }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue("2", forHTTPHeaderField: "x-api-version")

        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }

                guard let data = data else {
                    return continuation.resume(with: .failure(APIRequestError.noData))
                }

                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(responseObject))
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
