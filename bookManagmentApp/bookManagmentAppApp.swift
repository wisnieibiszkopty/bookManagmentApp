//
//  bookManagmentAppApp.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI

@main
struct bookManagmentAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
