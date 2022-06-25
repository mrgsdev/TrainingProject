import UIKit
//MARK: - Example 1 Decoding JSON
//let jsonfile = """
//{
//"name": "John Davis",
//"country": "Peru",
//"use": "the holidays." ,
//"amount": 150
//}
//"""
//
//struct Loan: Hashable, Codable {
//    var name: String
//    var country: String
//    var use: String
//    var amount: Int
//}
//
//
//let decoder = JSONDecoder()
//if let jsonData = jsonfile.data(using: .utf8) {
//    do {
//        let loan = try decoder.decode(Loan.self, from: jsonData)
//        print(loan)
//    } catch {
//        print(error)
//    }
//}


//MARK: - Example 2 (Working with Custom Property Names)
//Sometimes, the property name of your type and the key of the JSON data are not exactly matched. How can you perform the decoding? 👇
//let jsonfile = """
//{
//"name": "John Davis",
//"country": "Peru",
//"use": "the holidays." ,
//"loan_amount": 150
//}
//"""
//struct Loan: Hashable, Codable {
//    var name: String
//    var country: String
//    var use: String
//    var amount: Int
//    enum CodingKeys: String, CodingKey {
//        case name
//        case country
//        case use
//        case amount = "loan_amount"
//    }
//
//}
//let decoder = JSONDecoder()
//if let jsonData = jsonfile.data(using: .utf8) {
//    do {
//        let loan = try decoder.decode(Loan.self, from: jsonData)
//        print(loan)
//    } catch {
//        print(error)
//    }
//}



//MARK: - Example 3 (Working with Nested JSON Objects)
//let jsonfile = """
//{
//    "name": "John Davis",
//    "location": {
//     "country": "Peru",
//    },
//    "use": "to buy" ,
//    "loan_amount": 150
//}
//"""
//struct Loan: Hashable, Codable {
//    var name: String
//    var country: String
//    var use: String
//    var amount: Int
//    enum CodingKeys: String, CodingKey {
//        case name
//        case country = "location"
//        case use
//        case amount = "loan_amount"
//    }
//    enum LocationKeys: String, CodingKey {
//        case country
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        name = try values.decode(String.self, forKey: .name)
//        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
//        country = try location.decode(String.self, forKey: .country)
//        use = try values.decode(String.self, forKey: .use)
//        amount = try values.decode(Int.self, forKey: .amount)
//    }
//}
//let decoder = JSONDecoder()
//if let jsonData = jsonfile.data(using: .utf8) {
//    do {
//        let loan = try decoder.decode(Loan.self, from: jsonData)
//        print(loan)
//    } catch {
//        print(error)
//    }
//}


