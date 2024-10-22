//
//  boxView.swift
//  EmoryCals
//
//  Created by Aiden Min on 10/22/24.
//

import SwiftUI

struct boxView<Destination: View>: View {
    var destination: Destination
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(Color("box1"))
                .cornerRadius(10.0)
            
            NavigationLink(destination: destination) {
                Text("See More >")
                    .font(.system(size: 8.5))
                    .opacity(0.5)
                    .padding(2)
                    .frame(width: 250, height: 250, alignment: .topTrailing)
            }
        }
    }
}

#Preview {
    boxView(destination: CaloriesDetailView())
}
