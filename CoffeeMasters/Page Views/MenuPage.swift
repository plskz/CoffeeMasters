//  Date: 12/27/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    AppTitle()
                        .padding(.top, 4)
                    
                    if menuManager.menu.count == 0 {
                        HStack {
                            Text("We couldn't fetch the data")
                            Button("Reload") { }
                        }
                    } else {
                        ForEach(menuManager.menu) { category in
                            if category.products.count > 0 {
                                Text(category.name)
                                    .bold()
                                    .listRowBackground(Color("SurfaceBackground"))
                                    .foregroundColor(Color("Secondary"))
                                    .padding()
                            }
                            
                            ForEach(category.products) { item in
                                ZStack {
                                    NavigationLink(destination: DetailsPage(product: item)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    ProductItem(product: item)
                                        .padding(.top)
                                        .padding(.leading)
                                        .padding(.bottom, 12)
                                }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color("SurfaceBackground"))
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Products")
                .refreshable {
                    menuManager.refreshItemsFromNetwork()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
            .environmentObject(MenuManager())
            .environmentObject(LikesManager())
    }
}
