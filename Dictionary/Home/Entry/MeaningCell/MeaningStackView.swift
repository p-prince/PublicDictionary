import Foundation
import UIKit

class MeaningStackView: UIStackView {
    private let partOfSpeechLabel = UILabel()

    var viewModel: MeaningStackViewModelType? {
        didSet {
            setupUI()
        }
    }

    private func setupUI() {
        guard let viewModel = viewModel else { return }

        axis = .vertical
        spacing = 4

        setupPartOfSpeechLabel(with: viewModel.partOfSpeech)
        setupDefinitionStackViews(with: viewModel.definitions)
    }

    private func setupPartOfSpeechLabel(with text: NSAttributedString?) {
        partOfSpeechLabel.attributedText = text
        addArrangedSubview(partOfSpeechLabel)
    }

    private func setupDefinitionStackViews(with definitions: [Definition]) {
        for (index, definition) in definitions.prefix(3).enumerated() {
            let definitionStackView = DefinitionStackView()
            definitionStackView.spacing = 4
            
            let definitionStackViewModel = DefinitonStackViewModel(definition: definition, number: index + 1)
            definitionStackView.viewModel = definitionStackViewModel
            
            addArrangedSubview(definitionStackView)
        }
    }

}

