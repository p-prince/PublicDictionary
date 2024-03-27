import UIKit

protocol MeaningStackViewModelType {
    var partOfSpeech: NSMutableAttributedString? { get }
    var definitions: [Definition] { get }
}


class MeaningStackViewModel: MeaningStackViewModelType {
    private let meaning: Meaning?
    
    var definitions: [Definition] {
        meaning?.definitions ?? []
    }

    var partOfSpeech: NSMutableAttributedString? {
         guard let partOfSpeech = meaning?.partOfSpeech else { return nil }

         let partOfSpeechStrings: [PartOfSpeech: String] = [
             .noun: "noun.",
             .adjective: "adj.",
             .verb: "verb.",
             .adverb: "adv.",
             .conjuction: "conj.",
             .pronoun: "pron.",
             .preposition: "prep.",
             .interjection: "interj."
         ]

         guard let partOfSpeechString = partOfSpeechStrings[partOfSpeech] else {
             return nil
         }

         return partOfSpeechString.attributed(with: Attributes.partOfSpeech)
     }
    
    
    init(meaning: Meaning?) {
        self.meaning = meaning
    }
}
