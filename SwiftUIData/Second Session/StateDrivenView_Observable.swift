//
//  ContentView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 28.03.2024.
//

import SwiftUI
import Observation

@Observable
class StateModel_Observable {
    var counter = 0
    init(counter: Int = 0) {
        self.counter = counter
    }

    func increment() {
        counter += 1
    }

    func decrement() {
        counter -= 1
    }
}

struct StateDrivenView_Observable: View {
    @State var model = StateModel_Observable()
    var body: some View {
        HStack {
            Button("-") {
                model.decrement()
            }
            Text("\(model.counter)")
            Button("+") {
                model.increment()
            }
        }
    }
}

#Preview {
    StateDrivenView_Observable()
}

struct UUIDGeneratorView_Observable: View {
    @State var id: UUID = .init()
    var body: some View {
        let _ = Self._printChanges()
        Button("Generate") {
            id = UUID()
        }
        Text("\(id.uuidString)")
        StateDrivenView()
    }
}

#Preview("Generator") {
    UUIDGeneratorView_Observable()
}


