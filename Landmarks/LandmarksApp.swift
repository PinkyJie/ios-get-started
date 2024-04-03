//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Wenbo Jie on 30/3/24.
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
