//
//  StateDrivenView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

struct StateDrivenView_5: View {
    @State private var counter: Int

    init(counter: State<Int> = State(initialValue: 0)) {
        self._counter = counter
    }

    var body: some View {
        Stepper(
            "\(counter)",
            value: _counter.projectedValue,
            in: 0...10
        )
            .padding()
    }
}

#Preview {
    StateDrivenView_5()
}

