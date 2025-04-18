//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 이민지 on 4/15/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
