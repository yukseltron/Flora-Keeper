import SwiftUI

struct Plant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var soilPref: SoilPref
    var species: String
    fileprivate var imageName: String
    var lightLevel: LightLevel
    var isFavorite: Bool

    enum LightLevel: String, CaseIterable, Codable, Hashable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    
    enum SoilPref: String, CaseIterable, Codable, Hashable {
        case dry = "Dry"
        case damp = "Damp"
        case moist = "Moist"
    }
}

extension Plant {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
