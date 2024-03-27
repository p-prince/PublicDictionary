import Foundation
import UIKit

protocol EntryCellViewModelType {
    var title: NSMutableAttributedString? { get }
    var phonetic: String { get }
    var meanings: [Meaning] { get }
    var sound: URL? { get }
}

class EntryCellViewModel: EntryCellViewModelType {
    var entry: Entry

    var title: NSMutableAttributedString? {
        entry.word?.attributed(with: Attributes.title)
    }

    var phonetic: String {
        entry.phonetic ?? ""
    }
    
    var meanings: [Meaning] {
        entry.meanings
    }

    var sound: URL? {
        // get the first audio in the list of audios which isn't empty
        guard let sound = entry.phonetics
                            .compactMap({ $0.audio })
                            .filter({ !$0.isEmpty })
                            .first else { return nil }

        return URL(string: sound)
    }

    init(entry: Entry) {
        self.entry = entry
    }

}
