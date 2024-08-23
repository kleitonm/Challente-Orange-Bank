//
//  DetailsViewController.swift
//  Desafio-itau
//
//  Created by Kleiton Mendes on 16/08/24.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var receipts: Receipts
    
    // MARK: UI
    private lazy var screenView: DetailsView = {
        let view = DetailsView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    // MARK: Init
    init(receipts: Receipts) {
        self.receipts = receipts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detalhes"
        configScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configScreen() {
//        guard let receipts else { return }
        screenView.setupDetails(receipt: receipts)
    }
}
