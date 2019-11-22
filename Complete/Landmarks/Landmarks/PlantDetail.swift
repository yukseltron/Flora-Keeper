/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a plant.
*/

import SwiftUI

struct PlantDetail: View {
    @EnvironmentObject var userData: UserData
    var plant: Plant
    
    var plantIndex: Int {
        userData.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    var body: some View {
        VStack {
            CircleImage(image: plant.image)
                .offset(x: 0, y: 130)
                .padding(.bottom, 130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: plant.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.plants[self.plantIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.plants[self.plantIndex]
                            .isFavorite {
                            Image(systemName: "circle.fill")
                                .foregroundColor(Color.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                Text(verbatim: plant.species)
                    .font(.subheadline)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct PlantDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PlantDetail(plant: userData.plants[0])
            .environmentObject(userData)
    }
}
