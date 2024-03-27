import UIKit

protocol HomeCoordinatorErrorHandling: AnyObject {
    func handleSearchError(_ error: Error)
}

class HomeCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let homeViewController = HomeViewController.loadFromStoryboard()
        let apiRequestDispatcher = APIRequestDispatcher()
        homeViewController.viewModel = HomeViewModel(apiRequestDispatcher: apiRequestDispatcher)
        homeViewController.homeCoordinator = self

        navigationController.setViewControllers([homeViewController], animated: false)
    }
}

extension HomeCoordinator: HomeCoordinatorErrorHandling {
    func handleSearchError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController.topViewController?.present(alertController, animated: true, completion: nil)
    }
}
