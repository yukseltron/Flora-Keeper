import SwiftUI

struct Plant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var species: String
    fileprivate var imageName: String
    var lightLevel: LightLevel
    var waterLevel: WaterLevel
    var isFavorite: Bool

    enum LightLevel: String, CaseIterable, Codable, Hashable {
        case low = "low"
        case medium = "medium"
        case high = "high"
    }
    
    enum WaterLevel: String, CaseIterable, Codable, Hashable {
        case low = "low"
        case medium = "medium"
        case high = "high"
    }
}

extension Plant {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
