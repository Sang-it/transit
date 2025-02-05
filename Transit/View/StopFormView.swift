import SwiftUI

struct StopFormView: View {
    @Binding var isPresented: Bool
    @State private var stopID = ""
    @State private var stopName = ""
    var addItem: (Int, String) -> Void

    var body: some View {
        Form {
            Section(header: Text("Stop Details")) {
                TextField("Stop ID", text: $stopID)
                    .keyboardType(.numberPad)
                TextField("Stop Name", text: $stopName)
            }

            Button("SUBMIT") {
                submitForm()
            }.frame(maxWidth: .infinity, alignment: .center)
                .disabled(stopID.count < 5 || stopName.isEmpty)
        }.presentationDetents([
            .medium, .large,
        ])
    }

    private func submitForm() {
        addItem(Int(stopID)!, stopName)
        stopID.removeAll()
        stopName.removeAll()
        isPresented.toggle()
    }
}
