import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("Location").bold()
                HStack {
                    Text("Latitude")
                    Divider()
                    TextField("Latitude", text: $profile.coordinates.latitude)
                    Text("Longitude")
                    Divider()
                    TextField("Longitude", text: $profile.coordinates.longitude)
                }
            }
            .padding(.bottom)
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable reminders")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Season").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
        }
        .padding(.bottom)
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
