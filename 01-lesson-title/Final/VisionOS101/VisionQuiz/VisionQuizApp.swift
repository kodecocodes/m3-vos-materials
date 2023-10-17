//
//  VisionQuizApp.swift
//  VisionQuiz
//
//  Created by Tim Mitra on 2023-10-12.
//

import SwiftUI
//import RealityKit

@main
struct VisionQuizApp: App {
    
    // var for fully immersive view
    @State private var currentStyle: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup(){
            CourseListView()
            //VolumeView()
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        } /* show how to be fully immersive */
          /* .immersionStyle(selection: $currentStyle, in: .full) */
    }
}
