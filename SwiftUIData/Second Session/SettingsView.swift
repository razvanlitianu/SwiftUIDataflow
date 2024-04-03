//
//  SettingsView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

class ProfileSettings: ObservableObject {
    @Published var notificationsEnabled: Bool = false
}

struct ProfileView: View {
    @ObservedObject var profileSettings: ProfileSettings

    var body: some View {
        Toggle(
            "Enable Notifications",
            isOn: $profileSettings.notificationsEnabled
        )
        .padding()
    }
}

class UserSettings: ObservableObject {
    @Published var profileSettings = ProfileSettings()
}

struct SettingsView: View {
    @ObservedObject var userSettings: UserSettings

    var body: some View {
        ProfileView(profileSettings: userSettings.profileSettings)
        if userSettings.profileSettings.notificationsEnabled {
            Text("Notifications are enabled")
        }
    }
}


#Preview {
    SettingsView(userSettings: UserSettings())
}
