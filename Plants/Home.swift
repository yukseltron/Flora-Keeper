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
            by: { $0.waterLevel.rawValue }
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
                Text("Add new plant")
                    .foregroundColor(.blue)
            }
        }
    }

    var body: some View {
        NavigationView {
            
            List {
                //Text(Weather().requestTest())
                    
                addNewPlantButton
                .sheet(isPresented: $showingNewPlant) {
                    AddPlant()
                }
                .padding(.leading)
            

                CategoryRow(categoryName: "Moist", items: self.categories["high"]!)

                CategoryRow(categoryName: "Damp", items: self.categories["medium"]!)

                CategoryRow(categoryName: "Dry", items: self.categories["low"]!)


                
                NavigationLink(destination: PlantList()) {
                    Text("See All")
                }
                .padding()
                
            }
            .navigationBarTitle(Text("Plants"))
                .padding(.leading, -10)
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
