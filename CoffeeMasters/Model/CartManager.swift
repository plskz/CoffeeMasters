//  Date: 12/28/22
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

class CartManager: ObservableObject {
    @Published var cart: [(Product, Int)] = []
}
