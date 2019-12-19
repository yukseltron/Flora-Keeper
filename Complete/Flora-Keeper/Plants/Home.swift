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
    
    @State var showingNewPlant = false
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
    
    var addNewPlantButton: some View {
        Button(action: { self.showingNewPlant.toggle() }) {
            HStack(spacing: 50) {
                Text("Today's weather")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
            }
            .padding([.top, .leading])
        }
    }

    var body: some View {
        NavigationView {
            
            List {
                //Text(Weather().requestTest())
                    
                addNewPlantButton
                .sheet(isPresented: $showingNewPlant) {
                    CurrentWeather()
                }
            

                CategoryRow(categoryName: "Moist", items: self.categories["Moist"]!)

                CategoryRow(categoryName: "Damp", items: self.categories["Damp"]!)

                CategoryRow(categoryName: "Dry", items: self.categories["Dry"]!)


                
                NavigationLink(destination: PlantList()) {
                    Text("See All")
                }
                .padding()
                
            }
            .navigationBarTitle(Text("Plants"))
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