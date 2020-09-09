import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    var coordinates: Coordinates
    
    static let `default` = Self(username: "Artemis", prefersNotifications: true, seasonalPhoto: .winter, coordinates: Coordinates(latitude: "2.0",longitude: "0.0"))
    
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .winter, coordinates: Coordinates) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
        self.coordinates = coordinates
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: String
        var longitude: String
        
        init (latitude: String, longitude: String) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
