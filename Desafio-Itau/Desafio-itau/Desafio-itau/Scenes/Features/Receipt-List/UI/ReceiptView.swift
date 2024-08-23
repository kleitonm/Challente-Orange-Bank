
import UIKit

final class ReceiptView: UIView {
    
    // MARK - UI
    lazy var receiptTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray4
        tableView.backgroundColor = .systemBackground
        tableView.separatorInset = .init(top: 0, left: 22, bottom: 0, right: 0)
        tableView.register(ReceiptsCell.self, forCellReuseIdentifier: ReceiptsCell.indentifaier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        configureViews()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ReceiptView {
    func configureViews() {
        addSubview(receiptTableView)
        
        NSLayoutConstraint.activate([
            receiptTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            receiptTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            receiptTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            receiptTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
