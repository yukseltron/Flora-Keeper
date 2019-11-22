/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An object that models a user profile.
*/
import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    var coordinates: Coordinates
    
    static let `default` = Self(username: "Artemis", prefersNotifications: true, seasonalPhoto: .winter, latitude: "0.0", longitude: "0.0")
    
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .winter, latitude: String, longitude: String) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
        self.coordinates = Coordinates(latitude: latitude, longitude: longitude)
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
