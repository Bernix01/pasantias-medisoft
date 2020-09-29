//
//  MedisoftApp.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI

@main
struct MedisoftApp: App {
    let persistenceController = PersistenceController.preview

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
