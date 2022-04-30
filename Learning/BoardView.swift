//
//  BoardView.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI
import RiveRuntime

struct BoardView: View {
    let button: RiveViewModel = RiveViewModel(fileName: "newRive", artboardName: "main")
    @State var modalView = false
    
    var body: some View {
        ZStack {
            RiveViewModel(fileName: "shapes").view().blur(radius: 30)
                .background(Image("Spline").blur(radius: 50)).background(Color("Background 2")).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Learning & Coding").font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle)).frame(width: 280, alignment: .leading)
                Text("Don't skip design. This is a really import part to coding. Design your project, design your code also design your life.").newFont(style: .body).opacity(0.7).frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                button.view().frame(width: 236, height: 64)
                    .overlay(
                        Label("Getting start", systemImage: "arrow.forward").offset(x:4, y:4).font(.headline)
                    )
                    .background(Color.black.cornerRadius(30).blur(radius: 30).opacity(0.4).offset(y: 10))
                    .onTapGesture {
                        button.play(animationName: "active")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation(.spring()) {
                                modalView = true
                            }
                            
                        }
                }
                Text("Try the courses with premium materials to broaden your view and train your skills").newFont(style: .footnote)
            }.padding(40).padding(.top, 40).offset(y: modalView ? -50 : 0)
            Color("Shadow").opacity(modalView ? 0.3 : 0).ignoresSafeArea()
            if modalView {
                SignView(showModal: $modalView).transition(.move(edge: .bottom).combined(with: .opacity)).overlay(
                    Button(action: {
                        withAnimation(.spring()) {
                            modalView = false
                        }
                    }, label: {
                        Image(systemName: "xmark").frame(width: 36, height: 36).foregroundColor(.white).background(Color(hex: "F77D8E")).mask(Circle()).shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                    }).frame(maxHeight: .infinity, alignment: .bottom)
                ).zIndex(1)
                    
            }
        }
    
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoardView().preferredColorScheme(.dark)
        }
    }
}
