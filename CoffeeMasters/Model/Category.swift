//  Date: 12/28/22
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product]
    
    var id: String {
        return self.name
    }
}
