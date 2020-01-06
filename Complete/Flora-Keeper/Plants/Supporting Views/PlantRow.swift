import SwiftUI

struct PlantRow: View {
    var plant: Plant

    var body: some View {
        HStack {
            plant.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: plant.name)
            Text(verbatim: plant.species)
                .font(.caption)
                .italic()
                .padding(.bottom, -4)
            Spacer()

            if plant.isFavorite {
                Image(systemName: "house.fill")
                    .imageScale(.medium)
                    .foregroundColor(.green)
            }
        }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlantRow(plant: plantData[0])
            PlantRow(plant: plantData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
