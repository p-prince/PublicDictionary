import XCTest
@testable import Dictionary

class MeaningStackViewModelTests: XCTestCase {
    
    var viewModel: MeaningStackViewModel!
    var meaning: Meaning!
    
    func testAdjectivePartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .adjective, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "adj."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testNounPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .noun, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "noun."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testVerbPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .verb, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "verb."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testAdverbPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .adverb, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "adv."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testConjunctionPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .conjuction, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "conj."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testPronounPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .pronoun, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "pron."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testPrepositionPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .preposition, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "prep."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }
    
    func testInterjectionPartOfSpeech() {
        let meaning = Meaning(partOfSpeech: .interjection, definitions: [], synonyms: nil, antonyms: nil)
        viewModel = MeaningStackViewModel(meaning: meaning)
        
        let expectedPartOfSpeech = "interj."
        XCTAssertEqual(viewModel.partOfSpeech?.string, expectedPartOfSpeech)
    }

}
