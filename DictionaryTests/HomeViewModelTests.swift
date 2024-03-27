import XCTest
@testable import Dictionary

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    var mockAPIRequestDispatcher: MockAPIRequestDispatcher!
    
    override func setUp() {
        super.setUp()
        
        mockAPIRequestDispatcher = MockAPIRequestDispatcher()
        sut = HomeViewModel(apiRequestDispatcher: mockAPIRequestDispatcher)
    }

    override func tearDown() {
        sut = nil
        mockAPIRequestDispatcher = nil
        super.tearDown()
    }
    
    func testFetchResultsSuccess() async {
        let searchText = "Test Search Text"
        let mockResponse: [Entry] = [Entry(word: "test", phonetic: "te-st", phonetics: [], meanings: [])]
        mockAPIRequestDispatcher.response = .success(mockResponse)
        
        do {
            try await sut.fetchResults(for: searchText)
            XCTAssertEqual(sut.entries.first?.word, mockResponse.first?.word)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFetchResultsFailure() async {
        let searchText = "Test Search Text"
        let testError = APIRequestError.badUrl
        mockAPIRequestDispatcher.response = .failure(testError)

        do {
            try await sut.fetchResults(for: searchText)
            XCTFail("Expected fetchResults to throw an error")
        } catch {
            let expectedError = APIRequestError.badUrl
            XCTAssertEqual((error as? APIRequestError)?.localizedDescription, expectedError.localizedDescription)
        }
    }
}

class MockAPIRequestDispatcher: APIRequestDispatcherProtocol {
    var response: Result<[Entry], Error>?
    
    func request<T: Codable>(apiRouter: APIRouterType) async throws -> T {
        guard let response = response else {
            throw NSError(domain: "MockAPIRequestDispatcher", code: 404, userInfo: [NSLocalizedDescriptionKey: "Response not set"])
        }
        switch response {
        case .success(let entries):
            return entries as! T
        case .failure(let error):
            throw error
        }
    }
}
