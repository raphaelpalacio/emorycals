//
//  ContentView.swift
//  EmoryCals
//
//  Created by Aiden Min on 8/3/24.
//

import SwiftUI

struct introView: View {
    var body: some View {
        ZStack {
            Color("emoryBlue")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("emoryEagle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: -10)
                Text("EmoryCals")
                    .fontWeight(.medium)
                    .font(.title2)
                Spacer()
                
                Button{
                }label: {
                    signupButtonView(title: "Sign Up", color: "graysignup")
                }
                .padding()
                
                Button{
                }label: {
                    signupButtonView(title: "Log In", color: "yellowsignup")
                }
                
                Spacer()
                
            }
        }

    }
}

#Preview {
    introView()
}
