//
//  mainPageView.swift
//  EmoryCals
//
//  Created by Aiden Min on 8/6/24.
//

import SwiftUI

struct mainPageView: View {
    let dailyCalories: Int
    let user: String = "Raphael"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("emoryBlue")
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("Calories")
                    
                    ZStack { // ZStack for box
                        boxView(destination: CaloriesDetailView())
                        
                        Circle() // Circle for text content
                            .frame(width: 150, height: 150)
                            .opacity(0)
                            .overlay {
                                Text("Daily Calories: \(dailyCalories)")
                                    .multilineTextAlignment(.center)
                            }
                        
                        Circle() // Grey bar
                            .stroke(lineWidth: 10)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 150)
                        
                        progressBarColorView(calories: dailyCalories)
                    }
                    Spacer()
                    Text("Workouts")
                    ZStack {
                        boxView(destination: WorkoutsDetailView())
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Welcome, \(user)!")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        // Add action for the profile button
                    } label: {
                        Image(systemName: "person.fill")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        // Add action for the settings button
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

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

struct progressBarColorView: View {
    let calories: Int
    private let maxCalories: Int = 3000
    
    // Calculate progress based on calories and maxCalories
    private var progress: CGFloat {
        CGFloat(min(Double(calories) / Double(maxCalories), 1.0))
    }
    
    var body: some View {
        Circle() // Green or red progress bar
            .trim(from: 0.0, to: progress)
            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .foregroundColor(calories > maxCalories ? Color.red : Color.green)
            .rotationEffect(Angle(degrees: -90))
            .frame(width: 150, height: 150)
    }
}

struct CaloriesDetailView: View {
    var body: some View {
        Text("Calories Detail View")
            .font(.largeTitle)
            .padding()
    }
}

struct WorkoutsDetailView: View {
    var body: some View {
        Text("Workouts Detail View")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    mainPageView(dailyCalories: 2499)
}
