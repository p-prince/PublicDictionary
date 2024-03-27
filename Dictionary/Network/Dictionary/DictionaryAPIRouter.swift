
enum DictionaryAPIRouter: APIRouterType {
    case getEntries(word: String)

    var host: String {
        switch self {
        case .getEntries:
            return "api.dictionaryapi.dev"
        }
    }

    var scheme: String {
        switch self {
        case .getEntries:
            return "https"
        }
    }

    var path: String {
        var path = "/api/v2/"

        switch self {
        case .getEntries(let word):
            path += "entries/en/\(word)"
        }

        return path
    }

    var method: String {
        switch self {
        case .getEntries:
            return "GET"
        }
    }
}
