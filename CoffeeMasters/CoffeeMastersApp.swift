//  Date: 12/26/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

@main
struct CoffeeMastersApp: App {
    
    var menuManager = MenuManager()
    var cartManager = CartManager()
    var likesManager = LikesManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(cartManager)
                .environmentObject(likesManager)
        }
    }
}
