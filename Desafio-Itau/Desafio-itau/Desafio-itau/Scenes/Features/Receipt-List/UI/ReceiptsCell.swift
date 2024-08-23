//
//  ReceiptsCell.swift
//  Desafio-itau
//
//  Created by Kleiton Mendes on 11/08/24.
//

import UIKit

final class ReceiptsCell: UITableViewCell {
    
    static var indentifaier: String {
        return String(describing: self)
    }
    
    // MARK: UI
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,
                                                   receiverNameLabel,
                                                   amountLabel,
                                                   dateLabel
                                                   ])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var receiverNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .gray
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell(receipt: Receipts) {
        titleLabel.text = receipt.title
        receiverNameLabel.text = receipt.receiverName
        amountLabel.text = receipt.amount
        dateLabel.text = receipt.date
    }
}


extension ReceiptsCell {
    func configureViews() {
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -16)
        ])
    }
}
