//
//  ContentView.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("chooseTab") var chooseTab: Tab = .chat
    @State var show = false
    @State var isOpen = false
    let switchbutton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine",autoPlay: false)
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            HomeScreen()
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 80)
                }
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 104)
                }
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1).offset(x: isOpen ? 265 : 0).scaleEffect(isOpen ? 0.9 : 1)
                .scaleEffect(show ? 0.92 : 1).ignoresSafeArea()
            
            SideScreen().padding(.top, 50).opacity(isOpen ? 1 : 0).offset(x: isOpen ? 0 : -300).rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0)).ignoresSafeArea(.all, edges: .top)
            
            Image(systemName: "person").foregroundColor(.black).frame(width: 36, height: 36).background(.white).mask(Circle()).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing).shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5).padding().offset(y: 4).offset(x: isOpen ? 100 : 0)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        show = true
                    }
                }
            
            if show {
                BoardView(show:$show).background(.black.opacity(0.9)).mask(RoundedRectangle(cornerRadius: 30, style: .continuous)).shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top).offset(y: show ? -10 : 0)
                    .zIndex(1).transition(.move(edge: .top))
            }
            
            
            
            
            switchbutton.view().frame(width: 44, height: 44).mask(Circle()).shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).padding().offset(x: isOpen ? 216 : 0)
            .onTapGesture {
                switchbutton.setInput("isOpen", value: isOpen)
                withAnimation() {
                    isOpen.toggle()
                }
            }
            
            
        
            tabBar().offset(y: -16).ignoresSafeArea()
                .offset(y: isOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
