//
//  VolumeView.swift
//  VisionQuiz
//
//  Created by Tim Mitra on 2023-10-13.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct VolumeView: View {
    
    @State var startAnimation = false
    
     var body: some View {
         VStack {
             Button("Swim") {
                 startAnimation = true
             }.padding3D(.all)
             
             RealityView { content in
                 // Add the initial RealityKit content
                 if let tosakin = loadEntity() {
                     content.add(tosakin)
                     tosakin.isEnabled = true
                     tosakin.availableAnimations.forEach { animation in
                         tosakin.playAnimation(animation.repeat(), transitionDuration: 3, startsPaused: false)
                     }
                 }
             }
         }
    }
    
    private func loadEntity() -> Entity? {
       let entity = try? Entity.load(
        named: "Scene", in: realityKitContentBundle
        )
        entity?.setScale(.init(x: 0.15, y: 0.15, z: 0.15), relativeTo: nil)
        return entity
    }
}

#Preview {
    VolumeView()
}
