//
//  TransitApp.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftData
import SwiftUI

@main
struct TransitApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Stop.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
