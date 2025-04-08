//
//  Recipe_AppApp.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import SwiftUI

@main
struct Recipe_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: MockRecipeService())
        }
    }
}
