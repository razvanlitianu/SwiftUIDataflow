//
//  SwiftUIView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 03.04.2024.
//

import SwiftUI

class StateModel_ObservedObject: ObservableObject {
    @Published var counter = 0

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

struct StateDrivenView_ObservedObject: View {
    @ObservedObject var model = StateModel_ObservedObject()
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

struct UUIDGeneratorView_ObservedObject: View {
    @State var id: UUID = .init()
    var body: some View {
        let _ = Self._printChanges()
        Button("Generate") {
            id = UUID()
        }
        Text("\(id.uuidString)")
        StateDrivenView_ObservedObject()
    }
}

#Preview {
    UUIDGeneratorView_ObservedObject()
}
