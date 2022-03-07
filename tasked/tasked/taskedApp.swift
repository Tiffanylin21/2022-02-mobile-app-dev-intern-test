//
//  taskedApp.swift
//  tasked
//
//  Created by Tiffany Lin on 2/3/22.
//

import SwiftUI

@main
struct taskedApp: App {
    @StateObject var taskStore = TaskStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskStore)
        }
    }
}
