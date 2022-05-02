//
//  LearningCard.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI

struct LearningCard: View {
    var course: Course
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.title).newFont(style: .title2).frame(maxWidth: 170, alignment: .leading).layoutPriority(1)
            Text(course.subtitle).newFont(style: .subheadline).opacity(0.7).frame(maxWidth: .infinity, alignment: .leading)
            Text(course.caption.uppercased()).newFont(style: .footnote2)
            Spacer()
            HStack {
                ForEach(Array([1,2,3,4,5,6].shuffled()[0..<3].enumerated()), id: \.offset) { index, number in
                    Image("Avatar \(number)").resizable().mask(Circle()).frame(width: 44, height: 44).offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundColor(.white).padding(30).frame(width: 260, height: 310)
        .background(.linearGradient(colors: [course.color.opacity(1), course.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: course.color.opacity(0.5), radius: 8, x: 0, y: 12)
        .overlay(
            course.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20)
        )
    }
}

struct LearningCard_Previews: PreviewProvider {
    static var previews: some View {
        LearningCard(course: courses[0]).preferredColorScheme(.dark)
    }
}
