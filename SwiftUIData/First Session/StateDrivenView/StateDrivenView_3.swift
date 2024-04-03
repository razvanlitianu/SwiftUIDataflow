//
//  StateDrivenView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

struct StateDrivenView_3: View {
    @State private var counter: Int

//    var _counter: State<Int>

    init(counter: State<Int> = State(initialValue: 0)) {
        self._counter = counter
    }

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
    StateDrivenView_3()
}
