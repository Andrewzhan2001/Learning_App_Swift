//
//  newTextView.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI

struct newTextField: ViewModifier {
    var image: String
    func body(content: Content) -> some View {
        content.padding(15).padding(.leading, 36).background(Color.gray.opacity(0.3)).mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke())
            .overlay(Image(image).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 8))
    }
}

extension View {
    func NewTextField(image: String = "Icon Email") -> some View {
        modifier(newTextField(image: image))
    }
}
