import UIKit
import AVKit

class EntryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneticLabel: UILabel!
    @IBOutlet weak var spacerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var meaningStackView: UIStackView!

    private var player: AVAudioPlayer?

    private struct Constants {
        static let cornerRadius: CGFloat = 15.0
    }

    var viewModel: EntryCellViewModelType? {
        didSet {
            setupUI()
        }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
    }

    // MARK: - Private Methods

    private func setupAppearance() {
        stackView.layer.cornerRadius = Constants.cornerRadius
    }

    private func setupUI() {
        guard let viewModel = viewModel else { return }
        titleLabel.attributedText = viewModel.title
        phoneticLabel.text = viewModel.phonetic
        setupMeaningViews()
    }

    private func setupMeaningViews() {
        clearMeaningsStackView()
        meaningStackView.spacing = 16

        viewModel?.meanings.forEach { meaning in
            let meaningView = MeaningStackView()
            meaningView.viewModel = MeaningStackViewModel(meaning: meaning)
            meaningStackView.addArrangedSubview(meaningView)
        }
    }
    
    private func clearMeaningsStackView() {
        meaningStackView.arrangedSubviews.forEach { subview in
            meaningStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }

    private func downloadFileFromURL(url: URL) {
        let downloadTask = URLSession.shared.downloadTask(with: url) { [weak self] url, _, _ in
            self?.play(url: url)
        }
        downloadTask.resume()
    }

    private func play(url: URL?) {
        guard let url else { return }
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.volume = 1.0
            player?.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }

    // MARK: - Actions

    @IBAction func soundTapped(_ sender: Any) {
        guard let viewModel = viewModel, let url = viewModel.sound else { return }
        downloadFileFromURL(url: url)
    }
}
