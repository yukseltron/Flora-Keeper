/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of plants.
*/

import SwiftUI

struct PlantRow: View {
    var plant: Plant

    var body: some View {
        HStack {
            plant.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: plant.name)
            Spacer()

            if plant.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
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
