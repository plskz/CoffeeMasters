//  Date: 12/27/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct Offer: View {
    var title = "title"
    var description = "description"
    
    var body: some View {
        ZStack {
            Image("BackgroundPattern")
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
            
            VStack {
                Text(title)
                    .padding()
                    .font(.title)
                    .background(Color("CardBackground"))
                Text(description)
                    .padding()
                    .background(Color("CardBackground"))
            }
        }
    }
}

struct Offer_Previews: PreviewProvider {
    static var previews: some View {
        Offer()
    }
}
