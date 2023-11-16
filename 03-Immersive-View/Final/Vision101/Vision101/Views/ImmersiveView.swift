/// Copyright (c) 2023 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
  var body: some View {
    
    // 27
    SkyView()
    // 18
    RealityView { content in
      if let scene = try? await Entity(named: "ImmersiveScene", in: realityKitContentBundle) {
        content.add(scene)
        // 28
        guard let resource = try? await EnvironmentResource(named: "Sunlight") else { return }
        let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 2.0)
        scene.components.set(iblComponent)
        scene.components.set(ImageBasedLightReceiverComponent(imageBasedLight: scene))
      }
    } update: { content in
      if let scene = content.entities.first {
        scene.availableAnimations.forEach { animation in
          scene.playAnimation(animation.repeat(), transitionDuration: 3, startsPaused: false)
        }
        // step 26
        scene.orientation = simd_quatf(angle: Float.pi/4, axis: [-0.5, 0.0, 0.0])
        // step 25
        let orbit = OrbitAnimation(duration: 20.0,
                                   axis: SIMD3<Float>(x: 0.1, y: 1.0, z: 0.0),
                                   startTransform: scene.transform,
                                   spinClockwise: false,
                                   orientToPath: true,
                                   rotationCount: 1.0,
                                   bindTarget: .transform,
                                   repeatMode: .repeat)
        
        if let animation = try? AnimationResource.generate(with: orbit) {
          scene.playAnimation(animation)
        }
      }
    }.offset(y: -2000) // step 22
      .offset(z: -1500)
  }
}

#Preview {
    ImmersiveView()
}
