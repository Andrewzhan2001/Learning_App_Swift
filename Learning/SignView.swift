//
//  SignView.swift
//  Learning
//
//  Created by Tianyi
//

import SwiftUI
import RiveRuntime

struct SignView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var showModal: Bool
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let celebration = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    func signin() {
        isLoading = true
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            // run after check animation done
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                celebration.triggerInput("Trigger explosion")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.spring()) {
                    showModal = false
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }
            // run after check animation done
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
        
    }
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
            Button {
                signin()
                
            } label: {
                Label("Sign In", systemImage: "arrow.right").newFont(style: .headline).padding(20).frame(maxWidth: .infinity).background(Color(hex: "F77D8E")).foregroundColor(.white).cornerRadius(20, [.topRight, .bottomLeft, .bottomRight]).cornerRadius(8, [.topLeft]).shadow(color: Color(hex: "F77D8E").opacity(0.3), radius: 20, x: 0, y: 10)
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
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))).padding().overlay(
                ZStack{
                    if isLoading {
                        check.view().frame(width: 100, height: 100).allowsHitTesting(false)
                    }
                    celebration.view().scaleEffect(3).allowsHitTesting(false)
                }
                
            )
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignView(showModal: .constant(true)).preferredColorScheme(.dark)
        }
    }
}
