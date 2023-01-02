//  Date: 12/28/22
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct Product: Decodable, Identifiable {
    var id: Int
    var name: String
    var price: Double
    var description: String?
    var image: String
    
    var imageURL: URL {
        URL(string: "https://firtman.github.io/coffeemasters/api/images/\(self.image)")!
    }
}
