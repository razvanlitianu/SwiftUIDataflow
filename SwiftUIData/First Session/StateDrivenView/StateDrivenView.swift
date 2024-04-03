//
//  StateDrivenView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

struct StateDrivenView: View {
    @State private var counter = 0
    var body: some View {
        HStack {
            Button("-") {
                counter -= 1
            }
            Text("\(counter)")
            Button("+") {
                counter += 1
            }
        }
    }
}

#Preview {
    StateDrivenView()
}
