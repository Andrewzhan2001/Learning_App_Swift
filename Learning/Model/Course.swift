//
//  Course.swift
//  AnimatedApp
//
//  Created by Tianyi
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var courses = [
    Course(title: "Focused Attention", subtitle: "People learn best when they direct their focus toward the content and experiences that relevant to learning.", caption: "Cognition", color: Color(hex: "7850F0"), image: Image("Topic 1")),
    Course(title: "Self - Awareness", subtitle: "People learn best when they have a deep understanding of who they are", caption: "Identity", color: Color(hex: "6792FF"), image: Image("Topic 2")),
    Course(title: "Life Experiences", subtitle: "People learn best when their unique life advantages and adversities are understood and responded to.", caption: "Individual Variability", color: Color(hex: "005FE7"), image: Image("Topic 1"))
]
