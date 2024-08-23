//
//  ReceiptFactory.swift
//  Desafio-itau
//
//  Created by Kleiton Mendes on 11/08/24.
//

import UIKit

enum ReceiptFactory {
    
    static func make() -> UIViewController {
        let service = ReceiptService()
        let viewModel = ReceiptViewModel(service: service)
        let viewController = ReceiptViewController(viewModel: viewModel)
        return viewController
    }
}
