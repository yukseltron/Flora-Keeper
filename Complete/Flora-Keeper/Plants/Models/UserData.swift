import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var plants = plantData
    @Published var profile = Profile.default
}
