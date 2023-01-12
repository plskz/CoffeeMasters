//  Date: 12/28/22
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct Category: Decodable, Identifiable {
    var id: String { name }
    var name: String
    var products: [Product] = []
    
    func filteredItems(text: String) -> [Product] {
        text.isEmpty ? products : products.filter{ $0.name.contains(text) }
    }
}
