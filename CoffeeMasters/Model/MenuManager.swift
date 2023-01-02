//  Date: 12/28/22
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation
import Alamofire

class MenuManager: ObservableObject {
    @Published var menu: [Category] = []
    
    init() {
        refreshItemsFromNetwork()
    }
    
    func refreshItemsFromNetwork() {
        AF.request("https://firtman.github.io/coffeemasters/api/menu.json")
            .responseDecodable(of: [Category].self) { response in
                if let menuFromNetwork = response.value {
                    print(menuFromNetwork)
                    self.menu = menuFromNetwork
                }
            }
    }
}
