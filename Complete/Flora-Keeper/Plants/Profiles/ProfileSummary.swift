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

func scheduleNotification(name: String, quantity: String) {
    let center = UNUserNotificationCenter.current()

    let content = UNMutableNotificationContent()
    content.title = name + " might be thirsty!"
    content.body = "Check their soil, they prefer a " + quantity + " amount of water."
    content.categoryIdentifier = "alarm"
    content.userInfo = ["customData": "fizzbuzz"]
    content.sound = UNNotificationSound.default

    var dateComponents = DateComponents()
    dateComponents.hour = 10
    dateComponents.minute = 30
    dateComponents.day = 02
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    center.add(request)
}
