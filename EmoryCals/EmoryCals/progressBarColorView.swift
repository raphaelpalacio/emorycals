//
//  progressBarColorView.swift
//  EmoryCals
//
//  Created by Aiden Min on 10/22/24.
//

import SwiftUI

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
#Preview {
    progressBarColorView(calories: 2000)
}
