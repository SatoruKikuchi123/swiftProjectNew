//
//  sortApp.swift
//  sort
//
//  Created by user on 2023/06/14.
//

import SwiftUI

@main
struct sortApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(SelectedData())
                
        }
    }
}
