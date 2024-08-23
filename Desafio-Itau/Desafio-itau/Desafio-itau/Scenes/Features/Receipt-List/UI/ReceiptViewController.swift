
import UIKit

class ReceiptViewController: UIViewController {
    
    // MARK: Constants
    private var viewModel: ReceiptViewModelProtocol
    
    // MARK: Init
    init(viewModel: ReceiptViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    private lazy var screenView: ReceiptView = {
        let view = ReceiptView()
        view.receiptTableView.dataSource = self
        view.receiptTableView.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comprovantes"
        didLoadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Private func
    private func didLoadData() {
        viewModel.loadJson { [weak self] result in
            switch result {
            case .success(let success):
                self?.viewModel.receipts = success.data.receipts
            case .failure(let failure):
                self?.showAlert(message: failure.localizedDescription)
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ops, ocorreu um erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ReceiptViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.receipts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptsCell.indentifaier, for: indexPath) as? ReceiptsCell else {
            return UITableViewCell()
        }
       
        cell.setupCell(receipt: viewModel.receipts[indexPath.row])
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsFactory.make(model: viewModel.receipts[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
   
}
