import SwiftUI

@propertyWrapper
class SimpleState {
    private var counter: Int {
        didSet {
            print(counter)
        }
    }

    var wrappedValue: Int {
        get { counter }
        set { counter = newValue }
    }

    init(wrappedValue: Int) {
        self.counter = wrappedValue
    }
}

struct StateDrivenView_SimpleState: View {
    @SimpleState var counter = 0
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
    StateDrivenView_SimpleState()
}
