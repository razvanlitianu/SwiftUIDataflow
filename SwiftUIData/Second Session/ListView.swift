//
//  ListView.swift
//  SwiftUIData
//
//  Created by Litianu, Razvan (Cognizant) on 01.04.2024.
//

import SwiftUI

struct TabExampleView: View {
    let model = ListModel()
    var body: some View {
        let _ = Self._printChanges()
        TabView {
            NavigationStack {
                ListView(model: model)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .badge(model.counters.count)
        }
    }
}

@Observable
class CounterModel {
    var count = 0
    init(count: Int = 0) {
        self.count = count
    }

    func incrementButtonTapped() {
        count += 1
    }

    func decrementButtonTapped() {
        count -= 1
    }
}

@Observable
class ListModel {
    var numbers: [Int] = []
    var counters: [CounterModel] = []
    func addButtonTapped() {
        self.numbers.append(0)
        self.counters.append(CounterModel())
    }
}

struct ListView: View {
    let model: ListModel

    var body: some View {
        let _ = Self._printChanges()
        Form {
            Section {
                ForEach(
                    self.model.numbers.indices, id: \.self
                ) { index in
                    HStack {
                        Button("-") { self.model.numbers[index] -= 1 }
                        Text(self.model.numbers[index].description)
                        Button("+") { self.model.numbers[index] += 1 }
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("Numbers")
            }
            Section {
                ForEach(self.model.counters) { counterModel in
                    HStack {
                        Button("-") {
                            counterModel.decrementButtonTapped()
                        }
                        Text(counterModel.count.description)
                        Button("+") {
                            counterModel.incrementButtonTapped()
                        }
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("Counters")
            }
        }
        .toolbar {
              ToolbarItem {
                Button("Add") {
                  self.model.addButtonTapped()
                }
              }
            }
    }
}

extension CounterModel: Identifiable {}

#Preview {
    TabExampleView()
}
