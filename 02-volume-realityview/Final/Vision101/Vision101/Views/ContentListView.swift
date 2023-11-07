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

struct ContentListView: View {
  
  @State private var selectedCourse: Course? = nil
  
  let courses = [
    Course(name: "Window App", content: """
                           A volume is used to add 3D content to your app. Ut necessitatibus voluptate praesentium id eos eaque itaque cumque. Sunt error et et. Dignissimos veritatis eum ad eius omnis. Pariatur eaque nihil fuga omnis quia. Aperiam corporis odit vero aspernatur in recusandae.Delectus quo sed dolores quo architecto et necessitatibus aut. Velit impedit animi est. Sapiente animi nostrum aperiam quod ut eos. Debitis dicta voluptatem est atque. Soluta iure ipsum iure sed. Natus ut in voluptas et voluptates id
                           """),
    Course(name: "Volume App", content: """
                       A volume is used to add 3D content to your app. Ut necessitatibus voluptate praesentium id eos eaque itaque cumque. Sunt error et et. Dignissimos veritatis eum ad eius omnis. Pariatur eaque nihil fuga omnis quia. Aperiam corporis odit vero aspernatur in recusandae.Delectus quo sed dolores quo architecto et necessitatibus aut. Velit impedit animi est. Sapiente animi nostrum aperiam quod ut eos. Debitis dicta voluptatem est atque. Soluta iure ipsum iure sed. Natus ut in voluptas et voluptates id
                       """),
    Course(name: "Immersive App", content: """
                      An ImmersiveSpace takes over the view. Ut necessitatibus voluptate praesentium id eos eaque itaque cumque. Sunt error et et. Dignissimos veritatis eum ad eius omnis. Pariatur eaque nihil fuga omnis quia. Aperiam corporis odit vero aspernatur in recusandae.Delectus quo sed dolores quo architecto et necessitatibus aut. Velit impedit animi est. Sapiente animi nostrum aperiam quod ut eos. Debitis dicta voluptatem est atque. Soluta iure ipsum iure sed. Natus ut in voluptas et voluptates id
                      """),
    Course(name: "Ornaments", content: ""),
    Course(name: "App Icon", content: "")
  ]
  
  var body: some View {
    TabView {
      NavigationSplitView {
        List(courses, selection: $selectedCourse) { course in
          NavigationLink(course.name, value:course)
        }
      } detail: {
        if let selectedCourse = selectedCourse {
          CourseView(course: selectedCourse)
        } else {
          Text("Select a course from the list to see its details.")
        }
      }
      .tabItem {
        Image(systemName: "window.awning.closed")
        Text("Window")
      }
      // 13
      NavigationSplitView {
        Text("Volume Tab")
          .font(.largeTitle)
          .foregroundColor(.orange)
      } detail: {
        VolumeView()
      }
        .tabItem {
          Image(systemName: "cube")
          Text("Volume")
        }
      
      Text("Immersive Tab")
        .font(.system(size: 30, weight: .bold, design: .rounded))
        .foregroundColor(.orange)
        .tabItem {
          Image(systemName: "globe")
          Text("Immersive")
        }
    }.padding()
  }
}

#Preview(windowStyle: .automatic) {
  ContentListView()
}
