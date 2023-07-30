//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Subeen on 2023/07/30.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
