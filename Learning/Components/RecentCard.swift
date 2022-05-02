//
//  RecentCard.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI

struct RecentCard: View {
    var card: CourseSection
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text(card.title)
                    .newFont(style: .title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(card.caption)
                    .newFont(style: .body)
            }
            Divider()
            card.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .foregroundColor(.white)
        .background(card.color)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct RecentCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentCard(card: courseSections[0])
    }
}
