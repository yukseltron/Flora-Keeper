import SwiftUI

struct PlantDetail: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    var plant: Plant
    
    var plantIndex: Int {
        userData.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    var body: some View {
        VStack {
            CircleImage(image: plant.image)
            
            Text(verbatim:
                plant.species)
                .font(.title)
                .italic()
                .padding(.top, 20)
            
            Button(action: {
                self.userData.plants[self.plantIndex]
                    .isFavorite.toggle()
            }) {
                if self.userData.plants[self.plantIndex]
                    .isFavorite {
                    Image(systemName: "house.fill")
                        .foregroundColor(Color.green)
                } else {
                    Image(systemName: "house")
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.bottom, 30)
            
            VStack(alignment: .leading) {
                HStack() {
                    if (plant.soilPref.rawValue == "Moist") {
                         Rectangle()
                             .cornerRadius(5)
                             .frame(width: 20, height: 20)
                             .foregroundColor(Color(red: 80/255, green: 65/255, blue: 64/255, opacity: 1.0))
                             .padding(.trailing, 30)
                     } else if (plant.soilPref.rawValue == "Damp") {
                         Rectangle()
                             .cornerRadius(5)
                             .frame(width: 20, height: 20)
                             .foregroundColor(Color(red: 169/255, green: 124/255, blue: 119/255, opacity: 1.0))
                            .padding(.trailing, 30)
                     } else {
                         Rectangle()
                             .cornerRadius(5)
                             .frame(width: 20, height: 20)
                             .foregroundColor(Color(red: 243/255, green: 198/255, blue: 119/255, opacity: 1.0))
                             .padding(.trailing, 30)
                     }
                    
                    Text(verbatim: String(plant.soilPref.rawValue) + " soil")
                        .font(.title)
                    
                    Spacer()
                }
                .padding()
                
                HStack() {
                    if (plant.lightLevel.rawValue == "Low") {
                         Rectangle()
                             .cornerRadius(20)
                             .frame(width: 20, height: 20)
                             .foregroundColor(Color(red: 255/255, green: 196/255, blue: 51/255, opacity: 1.0))
                             .padding(.trailing, 30)
                     } else if (plant.lightLevel.rawValue == "Medium") {
                         Rectangle()
                             .cornerRadius(20)
                             .frame(width: 20, height: 20)
                             .foregroundColor(Color(red: 255/255, green: 196/255, blue: 51/255, opacity: 1.0))
                            .padding(.trailing, 15)
                        
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 255/255, green: 196/255, blue: 51/255, opacity: 1.0))
                            .padding(.trailing, 15)
                        
                     } else {
                         Rectangle()
                             .cornerRadius(20)
                             .frame(width: 20, height: 20)
                             .foregroundColor(Color(red: 255/255, green: 196/255, blue: 51/255, opacity: 1.0))
                             .padding(.trailing, 10)
                        
                        Rectangle()
                               .cornerRadius(20)
                               .frame(width: 20, height: 20)
                               .foregroundColor(Color(red: 255/255, green: 196/255, blue: 51/255, opacity: 1.0))
                               .padding(.leading, 5)
                               .padding(.trailing, 10)
                        
                        Rectangle()
                               .cornerRadius(20)
                               .frame(width: 20, height: 20)
                               .foregroundColor(Color(red: 255/255, green: 196/255, blue: 51/255, opacity: 1.0))
                               .padding(.leading, 5)
                               .padding(.trailing, 10)
                     }
                    
                    Text(verbatim: String(plant.lightLevel.rawValue) + " Light\t")
                        .font(.title)
                    
                    Spacer()
                }
                .padding()
            }
            .padding()
            .padding(.leading, 30)
            
            Spacer()
        }
    }
}

struct PlantDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PlantDetail(plant: userData.plants[1])
            .environmentObject(userData)
    }
}
