import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Plant]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 10) {
                if (self.categoryName == "Moist") {
                    Rectangle()
                        .cornerRadius(5)
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(red: 80/255, green: 65/255, blue: 64/255, opacity: 1.0))
                        .padding(.leading, 15)
                        .padding(.bottom, 3)
                } else if (self.categoryName == "Damp") {
                    Rectangle()
                        .cornerRadius(5)
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(red: 169/255, green: 124/255, blue: 119/255, opacity: 1.0))
                        .padding(.leading, 15)
                        .padding(.bottom, 3)
                } else {
                    Rectangle()
                        .cornerRadius(5)
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(red: 243/255, green: 198/255, blue: 119/255, opacity: 1.0))
                        .padding(.leading, 15)
                        .padding(.bottom, 3)
                }
                
                Text("Keep " + self.categoryName)
                    .font(.headline)
                    .fontWeight(.semibold)
                
            }
            .padding(.top, 15)
            .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { plant in
                        NavigationLink(
                            destination: PlantDetail(
                                plant: plant
                            )
                        ) {
                            CategoryItem(plant: plant)
                        }
                    }
                }
            }
            .frame(height: 185)
            .padding(.bottom, 30)
            .padding(.top, 10)
        }
    }
}

struct CategoryItem: View {
    var plant: Plant
    var body: some View {
        VStack(alignment: .leading) {
            plant.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(20)
            
            Text(plant.name)
                .foregroundColor(.primary)
                .font(.body)
                .padding(.leading, 10)
            
            Text(plant.species)
                .foregroundColor(.primary)
                .font(.footnote)
                .italic()
                .padding(.leading, 10)
                .padding(.top, 5)
                
        }
        .padding(10)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: plantData[0].waterLevel.rawValue,
            items: Array(plantData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
