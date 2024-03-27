import UIKit

class DefinitionStackView: UIStackView {
    private let definitionLabel = UILabel()
    private let synonymsLabel = UILabel()
    private let antonymsLabel = UILabel()
    private let exampleLabel = UILabel()
    
    var viewModel: DefinitonStackViewModel? {
        didSet {
            setupUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
    }
    
    private func setupUI() {
        guard let viewModel else { return }

        definitionLabel.attributedText = viewModel.definitionString
        definitionLabel.numberOfLines = 0
        
        exampleLabel.attributedText = viewModel.example
        exampleLabel.numberOfLines = 0
        
        addArrangedSubview(definitionLabel)
        addArrangedSubview(exampleLabel)
    }
    
    private func setupStackView() {
        axis = .vertical
        distribution = .fill
        alignment = .fill
        spacing = 8
    }
}
