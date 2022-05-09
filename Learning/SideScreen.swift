//
//  SideScreen.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI
import RiveRuntime

struct SideScreen: View {
    @State var isDarkMode = false
    @AppStorage("selectedMenu") var selectedMenu: SelectedMenu = .home
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Image(systemName: "person").padding(12).background(.white.opacity(0.3)).mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("Tianyi Zhan")
                    Text("Developer").font(.subheadline).opacity(0.9)
                }
            }.frame(maxWidth: .infinity, alignment: .leading).padding()
            
            Text("BROWSE").font(.subheadline).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 24).padding(.top, 40).opacity(0.7)
            
            MenuRow(menuItems: menuItems)
            
            Text("HISTORY").font(.subheadline).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 24).padding(.top, 40).opacity(0.7)
            
            MenuRow(menuItems: menuItems2)
            
            Spacer()
            
            HStack(spacing: 14) {
                menuItems3[0].icon.view().frame(width: 32, height: 32).opacity(0.6)
                    .onChange(of: isDarkMode) { newValue in
                        if newValue {
                            menuItems3[0].icon.setInput("active", value: true)
                        } else {
                            menuItems3[0].icon.setInput("active", value: false)
                        }
                    }
                Text(menuItems3[0].text)
                
                Toggle("", isOn: $isDarkMode)
            }
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(8)
        }.foregroundColor(.white).frame(maxWidth: 288, maxHeight: .infinity).background(Color("Background")).mask(RoundedRectangle(cornerRadius: 30, style: .continuous)).frame(maxWidth: .infinity, alignment: .leading)
    }
    
}

struct SideScreen_Previews: PreviewProvider {
    static var previews: some View {
        SideScreen().preferredColorScheme(.dark)
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
]

var menuItems2 = [
    MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
    MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .notifications)
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .darkmode)
]

enum SelectedMenu: String {
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkmode
}
