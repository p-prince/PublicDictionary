import UIKit

class DefinitonStackViewModel {
    private let definition: Definition
    private let number: Int
    
    var definitionString: NSMutableAttributedString? {
        guard let definition = definition.definition else { return nil }
        return "\(number). \(definition)".attributed(with: Attributes.definition)
    }

    var example: NSMutableAttributedString? {
        guard let example = definition.example else { return nil }
        return "\"\(example)\"".attributed(with: Attributes.example)
    }

    init(definition: Definition,
         number: Int) {
        self.definition = definition
        self.number = number
    }
}
