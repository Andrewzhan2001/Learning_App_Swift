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
    @State var isOpen = false
    let switchbutton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine",autoPlay: false)
    
    var body: some View {
        switchbutton.view().frame(width: 44, height: 44).mask(Circle()).shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
        .onTapGesture {
            switchbutton.setInput("isOpen", value: isOpen)
            isOpen.toggle()
        }
        tabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
