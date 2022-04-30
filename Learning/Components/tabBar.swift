//
//  tabBar.swift
//  Learning
//
//  Created by toyika on 2023/2/16.
//

import SwiftUI
import RiveRuntime

struct tabBar: View {
    @AppStorage("chooseTab") var chooseTab: Tab = .chat
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(barItems) { item in
                    Button {
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            item.icon.setInput("active", value: false)
                        }
                        withAnimation {
                            chooseTab = item.tab
                        }
                    } label: {
                        item.icon.view()
                            .frame(width: 36, height: 36).frame(maxWidth: .infinity).opacity(chooseTab == item.tab ? 1 : 0.5)
                            .background(
                                VStack {
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: chooseTab == item.tab ? 20 : 0, height: 4).offset(y: -4)
                                        .opacity(chooseTab == item.tab ? 1 : 0)
                                    Spacer()
                                }
                            )
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 26, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .padding(.horizontal, 24)
        }
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar().preferredColorScheme(.dark)
    }
}

struct BarItem: Identifiable {
    var id=UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var barItems = [
    BarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
    BarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
    BarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
    BarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
    BarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
]

enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}
