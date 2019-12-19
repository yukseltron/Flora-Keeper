import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(self.profile.username)
                .bold()
                .font(.title)
            
            HStack {
                Text("Latitude: \(self.profile.coordinates.latitude)")
                
                Text("Longitude: \(self.profile.coordinates.longitude)")
            }
            
            Text("Water reminders: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Current Season: \(self.profile.seasonalPhoto.rawValue)")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
