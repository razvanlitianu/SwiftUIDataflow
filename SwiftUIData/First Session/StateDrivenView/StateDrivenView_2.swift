//
//  StateDrivenView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

struct StateDrivenView_2: View {
    private var counter: State<Int>

    init(counter: State<Int> = State(initialValue: 0)) {
        self.counter = counter
    }

    var body: some View {
        HStack {
            Button("-") {
                counter.wrappedValue -= 1
            }
            Text("\(counter.wrappedValue)")
            Button("+") {
                counter.wrappedValue += 1
            }
        }
    }
}

#Preview {
    StateDrivenView_2()
}

