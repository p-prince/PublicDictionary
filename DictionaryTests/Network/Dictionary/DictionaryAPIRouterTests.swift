//
//  DictionaryAPIRouterTests.swift
//  DictionaryTests
//
//  Created by Prince Odion on 11/10/2023.
//

import XCTest
@testable import Dictionary

final class DictionaryAPIRouterTests: XCTestCase {

    func testDictionaryAPIRouterHost() throws {
        let router = DictionaryAPIRouter.getEntries(word: "hi")
        XCTAssertEqual(router.host, "api.dictionaryapi.dev")
    }

    func testDictionaryAPIRouterScheme() throws {
        let router = DictionaryAPIRouter.getEntries(word: "hi")
        XCTAssertEqual(router.scheme, "https")
    }

    func testDictionaryAPIRouterPath() throws {
        let router = DictionaryAPIRouter.getEntries(word: "hi")
        XCTAssertEqual(router.path, "/api/v2/entries/en/hi")
    }

    func testDictionaryAPIRouterMethod() throws {
        let router = DictionaryAPIRouter.getEntries(word: "hi")
        XCTAssertEqual(router.method, "GET")
    }

}
