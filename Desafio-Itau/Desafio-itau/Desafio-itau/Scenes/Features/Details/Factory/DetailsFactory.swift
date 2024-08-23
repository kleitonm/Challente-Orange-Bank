//
//  DetailsFactory.swift
//  Desafio-itau
//
//  Created by Kleiton Mendes on 16/08/24.
//

import UIKit

enum DetailsFactory {
    static func make(model: Receipts) -> UIViewController {
        let controller = DetailsViewController(receipts: model)
        return controller
    }
}
