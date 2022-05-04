//
//  HomeScreen.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            Color("Background 2").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Courses")
                            .newFont(style: .largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(courses) { course in
                                LearningCard(course: course)
                            }
                        }
                        .padding(20)
                        .padding(.bottom, 10)
                    }
                    
                    VStack {
                        Text("Recent")
                            .newFont(style: .title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 20) {
                            ForEach(courseSections) { section in
                                RecentCard(card: section)
                            }
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().preferredColorScheme(.dark)
    }
}
