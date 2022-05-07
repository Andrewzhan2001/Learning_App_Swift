//
//  MenuRow.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI

struct MenuRow: View {
    @AppStorage("selectedMenu") var selectedMenu: SelectedMenu = .home
    var menuItems: [MenuItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(menuItems) { item in
                // divider
                Rectangle().frame(height: 1).opacity(0.1) .padding(.horizontal, 16)
                
                HStack(spacing: 14) {
                    item.icon.view().frame(width: 32, height: 32).opacity(0.6)
                    Text(item.text)
                    Spacer()
                } .padding(12) .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.blue).frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                        .frame(maxWidth: .infinity, alignment: .leading) // so the animation can start from beginning
                ) .onTapGesture {
                    withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                        selectedMenu = item.menu
                    }
                    item.icon.setInput("active", value: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        item.icon.setInput("active", value: false)
                    }
                }
            }
        }
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(menuItems: menuItems)
    }
}
