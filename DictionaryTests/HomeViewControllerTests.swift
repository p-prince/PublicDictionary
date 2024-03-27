import XCTest
@testable import Dictionary

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
        
        let registeredCell = sut.tableView.dequeueReusableCell(withIdentifier: "entryCell")
        XCTAssertNotNil(registeredCell)
        XCTAssertTrue(registeredCell is EntryCell)
    }

}
