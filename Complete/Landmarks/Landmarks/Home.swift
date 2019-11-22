/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing featured plants above a list of all of the plants.
*/

import SwiftUI


struct CategoryHome: View {
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }

    
    var categories: [String: [Plant]] {
        Dictionary(
            grouping: plantData,
            by: { $0.soilPref.rawValue }
        )
    }
    
    var featured: [Plant] {
        plantData.filter { $0.isFavorite }
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }

    var body: some View {
        NavigationView {
            
            List {
                
                if (UserData().profile.username == "") {
                    Text("Please set a location")
                } else {
                    Text(Weather().requestTest())
                }
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }

                
                NavigationLink(destination: PlantList()) {
                    Text("See All")
                }
                .padding(.leading)
                .padding(.top)
            }
            .navigationBarTitle(Text("Today"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost().environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedPlants: View {
    var plants: [Plant]
    var body: some View {
        plants[1].image.resizable()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
