//
//  signupButtonView.swift
//  EmoryCals
//
//  Created by Aiden Min on 8/3/24.
//

import SwiftUI

struct signupButtonView: View {
    var title: String
    var color: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color(color))
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}


#Preview {
    signupButtonView(title: "Sign Up", color: "graysignup")
}
