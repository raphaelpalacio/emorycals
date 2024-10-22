//
//  mainPageView.swift
//  EmoryCals
//
//  Created by Aiden Min on 8/6/24.
//

import SwiftUI
import SwiftData

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

struct CaloriesDetailView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Meal]()
    @Query var meals: [Meal]
    
    var body: some View {
        NavigationStack(path: $path){
            List {
                ForEach(meals) { meal in
                    NavigationLink(value: meal) {
                        Text(meal.name)
                    }
                }
            }
            .navigationTitle("Daily Calories")
            .navigationDestination(for: Meal.self){ meal in
                EditMealView(meal: meal)
            }
            .toolbar {
                Button("Add Meal", systemImage: "plus", action: addMeal)
            }
        }
    }
    func addMeal() {
        let meal = Meal(name: "")
        modelContext.insert(meal)
        path.append(meal)
    }
    
    
//    @State var meals: [String] = ["Chipotle Bowl", "McDonald's Big Mac"]
//    @State var snacks: [String] = ["Kettle Chips", "Popcorn"]
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                // Meals section
//                Section(header: Text("Meals")) {
//                    ForEach(meals, id: \.self) { meal in
//                        Text(meal)
//                    }
//                    .onDelete { indexSet in
//                        deleteItems(from: &meals, at: indexSet)
//                    }
//                }
//                
//                // Snacks section
//                Section(header: Text("Snacks")) {
//                    ForEach(snacks, id: \.self) { snack in
//                        Text(snack)
//                    }
//                    .onDelete { indexSet in
//                        deleteItems(from: &snacks, at: indexSet)
//                    }
//                }
//            }
//            .navigationTitle("Daily Calories")
//            .navigationBarItems(trailing: addButton)
//        }
//    }
//    
//    var addButton: some View {
//        Button("Add", action:{
//            add()
//        })
//    }
//    
//    // General delete function
//    func deleteItems(from array: inout [String], at offsets: IndexSet) {
//        array.remove(atOffsets: offsets)
//    }
//    func add() {
//        meals.append("hello")
//    }
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


// TO-DO:
//make sure the additions of meals update calorie count
// make the list items clickable to see their info
// "add" button functionality to let user able to add stuff
// make the edits to the list save after exiting the view

