//  Date: 1/11/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct AppTitle: View {
    var body: some View {
        HStack {
            Spacer()
            Image("logo")
            Spacer()
        }
        .padding(4)
        .listRowBackground(Color("Secondary"))
        .background(Color("Secondary"))
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        AppTitle()
    }
}
