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
        if text.count > 0 {
            return products.filter({ item in
                item.name.contains(text)
            })
        } else {
            return products
        }
    }
}
