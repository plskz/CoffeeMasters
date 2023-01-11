//  Date: 12/27/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct DetailsPage: View {
    @State private var quantity: Int = 1
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            AsyncImage(url: product.imageURL)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                .padding(.top, 32)
            
            Text(product.description ?? "No Description")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(24)
                .foregroundColor(Color("Primary"))
            
            Stepper("$ \(product.price, specifier: "%.2f") ea", value: $quantity, in: 1...10)
                .padding(30)
            
            Text("Subtotal $\(product.price * Double(quantity), specifier: "%.2f")")
                .bold()
                .padding(12)
            
            Button("Add \(quantity) to Cart") {
                cartManager.add(product: product, quantity: quantity)
                dismiss()
            }
            .padding()
            .frame(width: 250.0)
            .background(Color("Alternative2"))
            .foregroundColor(Color.black)
            .cornerRadius(25)
            
        }
        .navigationTitle(product.name)
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(
            product: Product(
                id: 14,
                name: "Flat White",
                price: 3.25,
                description: "We start with an extra shot of espresso, combine them with one of our signature powders, and finished with lightly aerated milk to create the perfect, velvety espresso beverage. Available in hazelnut, vanilla, mocha or classic flat white.",
                image: "flatwhite.png"
            )
        )
        .environmentObject(CartManager())
    }
}
