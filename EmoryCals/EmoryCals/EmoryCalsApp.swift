//
//  EmoryCalsApp.swift
//  EmoryCals
//
//  Created by Aiden Min on 8/3/24.
//

import SwiftUI
import SwiftData

@main
struct EmoryCalsApp: App {
    var body: some Scene {
        WindowGroup {
            OpeningView()
        }
        .modelContainer(for: Meal.self)
    }
}
