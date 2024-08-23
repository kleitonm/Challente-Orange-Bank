
import UIKit

struct DataModel: Decodable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let receipts: [Receipts]
    let pagination: Pagination
}

struct Receipts: Decodable, Equatable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}

struct Pagination: Decodable {
    let page, pageSize, totalElements, totalPages: Int
}
