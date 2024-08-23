//
//  DetailsView.swift
//  Desafio-itau
//
//  Created by Kleiton Mendes on 16/08/24.
//

import UIKit

final class DetailsView: UIView {
    
    // MARK: UI
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,
                                                   receiverNameLabel,
                                                   amountLabel,
                                                   dateLabel,
                                                   controlLabel,
                                                   receiptIdLabel
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
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
//        label.text = "Transferência"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
//        label.text = "Débora dos Santos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var receiverNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
//        label.text = "João da Silva"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
//        label.text = "R$ 5.000,00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
//        label.text = "qua, 27 de abril de 2022"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var controlLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
//        label.text = "HDUS36217367127DS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var receiptIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
//        label.text = "112312"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    func setupDetails(receipt: Receipts) {
        titleLabel.text = receipt.title
        nameLabel.text = receipt.name
        receiverNameLabel.text = receipt.receiverName
        amountLabel.text = receipt.amount
        dateLabel.text = receipt.date
        controlLabel.text = receipt.control
        receiptIdLabel.text = receipt.receiptId
    }
}


extension DetailsView {
    func configureViews() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -16)
        ])
    }
}
