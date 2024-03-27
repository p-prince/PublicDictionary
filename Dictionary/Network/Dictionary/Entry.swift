
struct Entry: Codable {
    let word: String?
    let phonetic: String?
    let phonetics: [Phonetic]
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let text: String?
    let audio: String?
    let sourceUrl: String?
    let license: License?
}

struct License: Codable {
    let name: String?
    let url: String?
}

struct Meaning: Codable {
    let partOfSpeech: PartOfSpeech?
    let definitions: [Definition]
    let synonyms: [String]?
    let antonyms: [String]?
}

struct Definition: Codable {
    let definition: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let example: String?
}

enum PartOfSpeech: String, Codable {
    case adjective
    case noun
    case verb
    case adverb
    case conjuction
    case pronoun
    case preposition
    case interjection
}
