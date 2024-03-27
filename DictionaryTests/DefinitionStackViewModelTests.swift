import XCTest
@testable import Dictionary

class DefinitonStackViewModelTests: XCTestCase {

    func testDefinitionString() {
        let definition = Definition(definition: "Test definition", synonyms: [], antonyms: nil, example: "\"Test example\"")
        let viewModel = DefinitonStackViewModel(definition: definition, number: 1)
        
        let expectedDefinitionString = "1. Test definition"
        XCTAssertEqual(viewModel.definitionString?.string, expectedDefinitionString)
    }
    
    func testExample() {
        let definition = Definition(definition: "Test definition", synonyms: [], antonyms: nil, example: "Test example")
        
        let viewModel = DefinitonStackViewModel(definition: definition, number: 1)
    
        let expectedExample = "\"Test example\""
        XCTAssertEqual(viewModel.example?.string, expectedExample)
    }
}
