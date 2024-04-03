//
//  ActivityView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

class UserActivity: ObservableObject {
    @Published var userName: String = "John Doe"
    var lastActiveTime = Date()
    var activityDescription: String {
        // This property computes something based on `lastActiveTime`
        // but doesn't need to trigger view updates itself.
        "Active recently \(lastActiveTime.formatted(date: .numeric, time: .standard))"
    }
}

struct ActivityView: View {
    @ObservedObject var userActivity: UserActivity

    var body: some View {
        let _ = Self._printChanges()
        Text("User: \(userActivity.userName)")
        Text("User was \(userActivity.activityDescription)")
        Button("Update Last Seen") {
            userActivity.lastActiveTime = Date() // This triggers the view to update, even though it's not displaying `lastUpdated`.
        }
    }
}

#Preview {
    ActivityView(userActivity: UserActivity())
}
