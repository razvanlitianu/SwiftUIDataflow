//
//  SettingsView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 01.04.2024.
//

import SwiftUI

@Observable
class ProfileSettings_Observable {
    var notificationsEnabled: Bool = false
}

struct ProfileView_Observable: View {
    @Bindable var profileSettings: ProfileSettings_Observable

    var body: some View {
        Toggle(
            "Enable Notifications",
            isOn: $profileSettings.notificationsEnabled
        )
        .padding()
    }
}

@Observable
class UserSettings_Observable {
    var profileSettings = ProfileSettings_Observable()
}

struct SettingsView_Observable: View {
    var userSettings: UserSettings_Observable

    var body: some View {
        let _ = Self._printChanges()
        Form {
            ProfileView_Observable(profileSettings: userSettings.profileSettings)
            if userSettings.profileSettings.notificationsEnabled {
                Text("Notifications are enabled")
            }
        }
    }
}


#Preview {
    SettingsView_Observable(userSettings: UserSettings_Observable())
}
