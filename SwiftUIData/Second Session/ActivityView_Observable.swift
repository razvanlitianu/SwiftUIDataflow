//
//  UserData.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 01.04.2024.
//

import SwiftUI

@Observable
class UserActivity_Observable {
    var userName: String = "John Doe"
    var lastActiveTime = Date()
    var activityDescription: String {
        // This property computes something based on `lastActiveTime`
        // but doesn't need to trigger view updates itself.
        "Active recently \(lastActiveTime.formatted(date: .numeric, time: .standard))"
    }
}

struct ActivityView_Observable: View {
    let userActivity: UserActivity_Observable

    var body: some View {
        let _ = Self._printChanges()
        Text("User: \(userActivity.userName)")
        Text("User was \(userActivity.activityDescription)")
        Button("Update Last Seen") {
            // This triggers the view to update, even though it's not displaying `lastUpdated`.
            userActivity.lastActiveTime = Date()
        }
    }
}

#Preview("ActivityView") {
    ActivityView_Observable(userActivity: UserActivity_Observable())
}
