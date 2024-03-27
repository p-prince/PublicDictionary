import Foundation
import UIKit

extension UIViewController {

    static var typeName: String {
        String(describing: self)
    }

    static func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: typeName, bundle: .main)

        guard let result = storyboard.instantiate(storyboardName: typeName) as? Self else {
            preconditionFailure("Storyboard does not contain ViewController with name '\(typeName)'")
        }

        return result
    }
}

extension UIStoryboard {

    func instantiate<T: UIViewController>(storyboardName: String) -> T? {
        guard let viewControllerName = storyboardName.components(separatedBy: ".").last else {
            return nil
        }

        if #available(iOS 13.0, *) {
            return instantiateViewController(identifier: viewControllerName) as? T
        } else {
            return instantiateViewController(withIdentifier: viewControllerName) as? T
        }
    }

}
