//
//  Meal.swift
//  EmoryCals
//
//  Created by Aiden Min on 10/22/24.
//

import Foundation
import SwiftData

@Model
class Meal { // aspects of the meal
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

