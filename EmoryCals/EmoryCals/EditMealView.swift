//
//  EditMealView.swift
//  EmoryCals
//
//  Created by Aiden Min on 10/22/24.
//

import SwiftUI

struct EditMealView: View {
    
    @Bindable var meal: Meal
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $meal.name)
                    .textInputAutocapitalization(.never)
            }
        }
        .navigationTitle("Edit Meal")
        .navigationBarTitleDisplayMode(.inline)
    }

}

//#Preview {
//    EditMealView()
//}
