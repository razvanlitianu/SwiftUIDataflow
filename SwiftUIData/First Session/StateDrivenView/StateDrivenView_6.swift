//
//  StateDrivenView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

struct StateDrivenView_6: View {
    @State private var counter: Int

    init(counter: State<Int> = State(initialValue: 0)) {
        self._counter = counter
    }

    var body: some View {
        Stepper(
            "\(counter)",
            value: Binding(get: {
                counter
            }, set: {
                counter = $0
            }),
            in: 0...10
        )
            .padding()
    }
}

#Preview {
    StateDrivenView_6()
}

