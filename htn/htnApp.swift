//
//  htnApp.swift
//  htn
//
//  Created by Akshayan on 2024-09-14.
//

import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct htnApp: App {
    @StateObject var storage = Storage()
    
    init() {
        FirebaseApp.configure()
    }
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
                .environmentObject(storage)
        }
        .modelContainer(sharedModelContainer)
    }
}
