//
//  NutritionModel.swift
//  OnlineGroceries
//
//  Created by William Rozier on 10/12/23.
//

import SwiftUI

struct NutritionModel: Identifiable, Equatable {
    
    var id: Int = 0
    var nutritionName: String = ""
    var nutritionValue: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.nutritionName = dict.value(forKey: "nutrition_name") as? String ?? ""
        self.nutritionValue = dict.value(forKey: "nutrition_value") as? String ?? ""
    }
    
    static func == (lhs: NutritionModel, rhs:NutritionModel) -> Bool {
        return lhs.id == rhs.id
    }
 
}
