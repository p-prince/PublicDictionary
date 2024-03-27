import Foundation

protocol HomeViewModelType {
    var entries: [Entry] { get }

    func fetchResults(for text: String) async throws
}

class HomeViewModel: HomeViewModelType {
    var entries: [Entry] = []
    private let apiRequestDispatcher: APIRequestDispatcherProtocol

    init(apiRequestDispatcher: APIRequestDispatcherProtocol) {
        self.apiRequestDispatcher = apiRequestDispatcher
    }

    func fetchResults(for text: String) async throws {
        let response: [Entry] = try await apiRequestDispatcher.request(apiRouter: DictionaryAPIRouter.getEntries(word: text))
        entries = response
    }
}
