import SwiftUI

struct PlantList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Owned only")
            }
            
            ForEach(userData.plants) { plant in
                if !self.userData.showFavoritesOnly || plant.isFavorite {
                    NavigationLink(
                        destination: PlantDetail(plant: plant)
                            .environmentObject(self.userData)
                    ) {
                        PlantRow(plant: plant)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Plants"))
    }
}

struct PlantsList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            NavigationView {
                PlantList()
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
