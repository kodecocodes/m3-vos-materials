//
//  VisionQuizApp.swift
//  VisionQuiz
//
//  Created by Tim Mitra on 2023-10-12.
//

import SwiftUI

@main
struct VisionQuizApp: App {
    var body: some Scene {
        WindowGroup("Window", id: "window"){
            CourseListView()
            //VolumeView()
        }.windowStyle(.plain)
        
        WindowGroup("Immersive", id: "immersive"){
            CourseListView()
            //VolumeView()
        }.windowStyle(.volumetric)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
