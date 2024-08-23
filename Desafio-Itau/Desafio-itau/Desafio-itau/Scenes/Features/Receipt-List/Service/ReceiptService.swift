
import Foundation

//enum ReceiptResult {
//    case success(DataModel)
//    case error(Error)
//}

protocol ReceiptServiceProtocol {
    func loadJson(completion: @escaping(Result<DataModel, Error>) -> Void)
}

final class ReceiptService {
}

extension ReceiptService: ReceiptServiceProtocol {
    func loadJson(completion: @escaping (Result<DataModel, any Error>) -> Void) {
        if let pathURL2 = Bundle.main.url(forResource:  "receiptMock", withExtension: "json") {
            do {
                if let jsonData = try? Data(contentsOf: pathURL2)  {
                    let dataModel = try JSONDecoder().decode(DataModel.self, from: jsonData)
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(error))
            }
            
        }
    }
    
}

