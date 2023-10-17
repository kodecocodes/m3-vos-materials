//
//  CourseView.swift
//  VisionQuiz
//
//  Created by Tim Mitra on 2023-10-12.
//

import SwiftUI

struct CourseView: View {
    
    let course: Course
    
    var body: some View {
        VStack {
              Text(course.name)
                .font(.largeTitle)
                Text(course.content)
                Spacer()
            }
            .navigationTitle(course.name)
    }
}

#Preview {
    CourseView(course: Course(name: "visionOS", content: """
This multiline content.
This multiline content.
This multiline content.
"""))
}
