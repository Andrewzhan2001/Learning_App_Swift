//
//  SignView.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI

struct SignView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign in").newFont(style: .largeTitle)
            Text("It is the time to start your journey!! Work hard and have fun !!!").newFont(style: .headline)
            VStack(alignment: .leading) {
                Text("Email").newFont(style: .subheadline).foregroundColor(.secondary)
                TextField("Email",text: $email).NewTextField()
            }
            VStack(alignment: .leading) {
                Text("Password").newFont(style: .subheadline).foregroundColor(.secondary)
                SecureField("Password",text: $password).NewTextField(image: "Icon Lock")
            }
            HStack {
                Rectangle().frame(height: 1)
                Text("OR").newFont(style: .subheadline)
                Rectangle().frame(height: 1)
            }
            Text("Sign up with Email, Apple or Google").newFont(style: .subheadline).foregroundColor(.secondary)
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
            
        }.padding(30).background(.regularMaterial).mask(RoundedRectangle(cornerRadius: 20, style: .continuous)).shadow(color: .gray.opacity(0.3), radius: 30, x: 0, y: 30)
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))).padding()
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView().preferredColorScheme(.dark)
    }
}
