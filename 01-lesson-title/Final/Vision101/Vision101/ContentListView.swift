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

struct Course: Identifiable, Hashable {
  let name: String
  let id = UUID()
}

struct ContentListView: View {
  
  @State private var selectedCourse: Course? = nil
  
  private var courses = [
    Course(name: "Window App"),
    Course(name: "Volume App"),
    Course(name: "Immersive App"),
    Course(name: "Ornaments"),
    Course(name: "App Icon")
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
      Text("Volume Tab")
        .font(.system(size: 30, weight: .bold, design: .rounded))
        .foregroundColor(.orange)
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
