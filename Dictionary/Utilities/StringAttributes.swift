import UIKit

enum Attributes {
    static let title: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Charter Bold", size: 23.0)!,
        .foregroundColor: UIColor.black
    ]

    static let definition: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Charter Roman", size: 15.0)!,
        .foregroundColor: UIColor.black
    ]
    
    static let example: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Charter Italic", size: 15.0)!,
        .foregroundColor: UIColor.darkGray
    ]

    static let partOfSpeech: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Charter Italic", size: 17.0)!,
        .foregroundColor: UIColor.black
    ]
}
