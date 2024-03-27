import Foundation

extension String {

    func attributed(with attributes: [NSAttributedString.Key: Any]? = nil) -> NSMutableAttributedString {
        .init(string: self, attributes: attributes)
    }

}
