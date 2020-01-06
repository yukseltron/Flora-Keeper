import SwiftUI

struct PlantList: View {
    @EnvironmentObject private var userData: UserData
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)

                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)

                if showCancelButton  {
                    Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton)
            
            List {
                /*
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show thirsty plants only")
                }
                 */
                
                ForEach(userData.plants.filter{searchText == "" || $0.name.hasPrefix(searchText) || $0.species.hasPrefix(searchText)}) { plant in
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
            .resignKeyboardOnDragGesture()
        }
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


extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
