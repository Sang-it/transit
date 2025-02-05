//
//  ContentView.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var stops: [Stop]
    @State var isAdding = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(stops) { item in
                    NavigationLink {
                        ScheduleListView(stopID: item.stopID, stopName: item.stopName)
                    } label: {
                        Text(item.stopName)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { isAdding.toggle() }) {
                        Label("Add Stop", systemImage: "plus")
                    }.sheet(isPresented: $isAdding) {
                        StopFormView(isPresented: $isAdding, addItem: addItem)
                    }
                }
            }
        } detail: {
            Text("Select a Stop")
        }
    }

    private func addItem(stopID: Int, stopName: String) {
        withAnimation {
            let newItem = Stop(stopID: stopID, stopName: stopName)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(stops[index])
            }
        }
    }
}
