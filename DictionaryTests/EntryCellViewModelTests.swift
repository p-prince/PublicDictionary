import XCTest
@testable import Dictionary

class EntryCellViewModelTests: XCTestCase {
    
    var viewModel: EntryCellViewModel!
    var entry: Entry!
    
    override func setUp() {
        super.setUp()
        
        entry = Entry(word: "Test", phonetic: "Phonetic", phonetics: [], meanings: [])
        
        viewModel = EntryCellViewModel(entry: entry)
    }
    
    override func tearDown() {
        viewModel = nil
        entry = nil
        super.tearDown()
    }
    
    func testTitle() {
        let expectedTitle = NSMutableAttributedString(string: "Test", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        XCTAssertEqual(viewModel.title?.string, expectedTitle.string)
    }
    
    func testPhonetic() {
        let expectedPhonetic = "Phonetic"
        
        XCTAssertEqual(viewModel.phonetic, expectedPhonetic)
    }
    
    func testSound() {
        let phonetics = [Phonetic(text: nil, audio: "test_sound.mp3", sourceUrl: nil, license: nil)]
        let entry = Entry(word: "Test", phonetic: "Phonetic", phonetics: phonetics, meanings: [])
        let viewModel = EntryCellViewModel(entry: entry)
        
        
        let expectedSoundURL = URL(string: "test_sound.mp3")
        
        XCTAssertEqual(viewModel.sound, expectedSoundURL)
    }
}
