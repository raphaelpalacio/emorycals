//
//  mainPageView.swift
//  EmoryCals
//
//  Created by Aiden Min on 8/6/24.
//

import SwiftUI

struct mainPageView: View {
    let dailyCalories: Int
    let user:String = "Raphael"
    
    var body: some View {
        ZStack {
            Color("emoryBlue")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Welcome, \(user)!")
                    .font(.title)
                    .padding(.bottom, 30)
                Text("Calories")
                
                ZStack { //zstack for box
                    boxView()
                
                    Circle() //circle for text content
                        .frame(width: 150, height: 150)
                        .opacity(0)
                        .overlay {
                            Text("Daily Calories: \(dailyCalories)")
                                .multilineTextAlignment(.center)
                        }
                    
                    Circle() //grey bar
                        .stroke(lineWidth: 10)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: 150, height: 150)
                    
                    progressBarColorView(calories: dailyCalories)
                }//iudeiudbi
                Spacer()
                Text("Workouts")
                ZStack {
                    
                    boxView()
                    
                }
                Spacer()
            }//udbfweiukbew
            .padding()
        }
    }
    
}

struct boxView: View {
    var body: some View{
        Rectangle()
            .frame(width: 250, height: 250)
            .foregroundColor(Color("box1"))
            .cornerRadius(10.0)

        Text("See More >")
            .font(.system(size: 8.5))
            .opacity(0.5)
            .padding(2)
            .frame(width: 250, height: 250, alignment: .topTrailing)
    }
}

struct progressBarColorView: View {
    let calories: Int
    private let maxCalories: Int = 2500
    @State private var progress: CGFloat = 0.75 // Example progress value
    var body: some View{
        Circle() //green bar
            .trim(from: 0.0, to: progress)
            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .foregroundColor(calories > maxCalories ? Color.red: Color.green)
            .rotationEffect(Angle(degrees: -90))
            .frame(width: 150, height: 150)
    }
}

#Preview {
    mainPageView(dailyCalories: 2499)
}
