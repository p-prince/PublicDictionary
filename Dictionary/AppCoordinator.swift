import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }

    func start()
}

class AppCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()

        let homeCoordinator = HomeCoordinator(navigationController: navigationController)

        childCoordinators.append(homeCoordinator)

        homeCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
