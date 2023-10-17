//
//  ContentView.swift
//  VisionQuiz
//
//  Created by Tim Mitra on 2023-10-12.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CourseListView: View {
    
    @Environment(\.openImmersiveSpace) var openImmersiveScene
    
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
    
    @State private var selectedCourse: Course? = nil
    
    var body: some View {
        TabView {
            NavigationSplitView {
                List(courses, selection: $selectedCourse) { course in
                    NavigationLink(course.name, value:course)
                }
                .navigationTitle("visionOS Courses")
                .font(.system(size: 30))
                .listStyle(.plain)
            } detail: {
                if let selectedCourse = selectedCourse {
                    CourseView(course: selectedCourse)
                        .padding(30)
                } else {
                    Text("Select a course from the list to see its details.")
                }
            }
            .tabItem {
                Image(systemName: "window.vertical.closed")
                Text("Window")
            }
            
            NavigationSplitView {
                Text("Volume")
                    .font(.system(size: 30))
                    .padding(30)
                Spacer()
            } detail: {
                VolumeView()
            }
                .tabItem {
                    Image(systemName: "cube.transparent")
                    Text("Volume")
            }
            
            NavigationSplitView {
                Text("Immersive")
                    .font(.system(size: 30))
                    .padding(30)
                Spacer()
            } detail: {
                Button("Open ImmersiveSpace") {
                    Task {
                        await openImmersiveScene(id: "ImmersiveSpace")
                    }
                }
                ImmersiveView()
            }
            .tabItem {
                    Image(systemName: "globe")
                    Text("Immersive")
                }
        }
    }
}


#Preview(windowStyle: .automatic) {
    CourseListView()
}
