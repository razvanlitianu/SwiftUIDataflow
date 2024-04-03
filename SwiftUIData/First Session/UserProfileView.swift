//
//  UserProfileView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 28.03.2024.
//

import SwiftUI

// Dummy User Model
struct User {
    var name: String
    var username: String
    var bio: String
}

struct UserProfileView: View {
    @State private var user = User(
        name: "John Doe",
        username: "@johndoe",
        bio: "Photography enthusiast. Lover of coffee."
    )
    @State private var showingEditScreen = false

    var body: some View {
        VStack {
            // Profile Image
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .padding(.top, 20)

            // User Name and Username
            Text(user.name)
                .font(.title)
                .bold()
            Text(user.username)
                .font(.subheadline)
                .foregroundColor(.gray)

            // Bio
            Text(user.bio)
                .font(.body)
                .padding()

            Button(action: { showingEditScreen.toggle() }, label: {
                Text("Edit Profile")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            .padding(.top, 10)

            Spacer()
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $showingEditScreen) {
            NavigationStack {
                EditUserProfileInternalStateView(
                    user: user,
                    didTapSave: { user in
                        self.user = user
                    })
            }
        }
    }
}

#Preview {
    NavigationView {
        UserProfileView()
    }
}

struct EditUserProfileInternalStateView: View {
    @State private var user: User
    @Environment(\.presentationMode) var presentationMode
    var didTapSave: (User) -> ()

    init(user: User, didTapSave: @escaping (User) -> Void) {
        self.user = user
        self.didTapSave = didTapSave
    }

    var body: some View {
        Form {
            Section(header: Text("Personal Info")) {
                TextField("Name", text: $user.name)
                TextField("Username", text: $user.username)
                TextField("Bio", text: $user.bio)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Save") {
                    didTapSave(user)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationTitle("Edit Profile")
    }
}
