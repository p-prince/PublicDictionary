import UIKit

class HomeViewController: UIViewController {

    var homeCoordinator: HomeCoordinator?
    var viewModel: HomeViewModelType!
    private let entryCellReuseIdentifier = "entryCell"

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EntryCell", bundle: nil), forCellReuseIdentifier: entryCellReuseIdentifier)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.entries.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: entryCellReuseIdentifier, for: indexPath) as! EntryCell
        let entry = viewModel.entries[indexPath.row]
        cell.viewModel = EntryCellViewModel(entry: entry)
        return cell
    }

}

extension HomeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Task {
            do {
                try await viewModel?.fetchResults(for: text)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    searchBar.resignFirstResponder()
                }
            } catch {
                homeCoordinator?.handleSearchError(error)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}
