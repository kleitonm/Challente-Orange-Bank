
import Foundation

protocol ReceiptViewModelProtocol {
    func loadJson(completion: @escaping(Result<DataModel, Error>) -> Void)
    var receipts: [Receipts] { get set }
}

final class ReceiptViewModel {
    private let service: ReceiptServiceProtocol
    private var receiptList = [Receipts]()
    
    init(service: ReceiptServiceProtocol) {
        self.service = service
    }
}

extension ReceiptViewModel: ReceiptViewModelProtocol {

    func loadJson(completion: @escaping (Result<DataModel, any Error>) -> Void) {
        service.loadJson { result in
            switch result {
            case .success(let dataModel):
                completion(.success(dataModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    var receipts: [Receipts] {
        get { receiptList }
        set { self.receiptList = newValue}
    }
    
}
