//
//  Course.swift
//  VisionQuiz
//
//  Created by Tim Mitra on 2023-10-12.
//

import Foundation

struct Course: Identifiable, Hashable {
    let name: String
    let id = UUID()
}
