import XCTest
@testable import Dictionary

class HomeCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var coordinator: HomeCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = HomeCoordinator(navigationController: navigationController)
    }
    
    override func tearDown() {
        navigationController = nil
        coordinator = nil
        super.tearDown()
    }
    
    func testStart() {
        coordinator.start()
        
        XCTAssertTrue(navigationController.viewControllers.count == 1)
        XCTAssertTrue(navigationController.viewControllers[0] is HomeViewController)
        XCTAssertNotNil((navigationController.viewControllers[0] as? HomeViewController)?.viewModel)
        XCTAssertNotNil((navigationController.viewControllers[0] as? HomeViewController)?.homeCoordinator)
    }

}
