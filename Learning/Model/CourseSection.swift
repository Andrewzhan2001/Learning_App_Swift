//
//  CourseSection.swift
//  AnimatedApp
//
//  Created by Tianyi
//

import SwiftUI

struct CourseSection: Identifiable {
    var id = UUID()
    var title: String
    var caption: String
    var color: Color
    var image: Image
}

var courseSections = [
    CourseSection(title: "Python", caption: "Dynamic semantics", color: Color(hex: "9CC5FF"), image: Image("Topic 2")),
    CourseSection(title: "Swift", caption: "Intuitive programming language", color: Color(hex: "6E6AE8"), image: Image("Topic 1")),
    CourseSection(title: "Java", caption: "Object-oriented programming", color: Color(hex: "005FE7"), image: Image("Topic 2")),
    CourseSection(title: "C++", caption: "Most bast programming language", color: Color(hex: "BBA6FF"), image: Image("Topic 1"))
]
