//
//  MDLRecipeDetails.swift
//  iOS_RecipeApp
//
//  Created by Hardik on 08/10/23.
//

import Foundation
import SwiftyJSON

struct MDLRecipeDetails {
    
    var recipeID = 0
    var recipeName = ""
    var recipeImage = ""
    var recipeInstruction = ""
    var ingredient1 = ""
    var ingredient2 = ""
    var ingredient3 = ""
    var ingredient4 = ""
    var ingredient5 = ""
    var ingredient6 = ""
    var ingredient7 = ""
    var ingredient8 = ""
    var ingredient9 = ""
    var ingredient10 = ""
    var ingredient11 = ""
    var ingredient12 = ""
    var ingredient13 = ""
    var ingredient14 = ""
    var ingredient15 = ""
    var ingredient16 = ""
    var ingredient17 = ""
    var ingredient18 = ""
    var ingredient19 = ""
    var ingredient20 = ""
    var measure1 = ""
    var measure2 = ""
    var measure3 = ""
    var measure4 = ""
    var measure5 = ""
    var measure6 = ""
    var measure7 = ""
    var measure8 = ""
    var measure9 = ""
    var measure10 = ""
    var measure11 = ""
    var measure12 = ""
    var measure13 = ""
    var measure14 = ""
    var measure15 = ""
    var measure16 = ""
    var measure17 = ""
    var measure18 = ""
    var measure19 = ""
    var measure20 = ""

    init(params: JSON) {
        
        recipeID = params["idMeal"].intValue
        recipeName = params["strMeal"].stringValue
        recipeImage = params["strMealThumb"].stringValue
        recipeInstruction = params["strInstructions"].stringValue
        ingredient1 = params["strIngredient1"].stringValue
        ingredient2 = params["strIngredient2"].stringValue
        ingredient3 = params["strIngredient3"].stringValue
        ingredient4 = params["strIngredient4"].stringValue
        ingredient5 = params["strIngredient5"].stringValue
        ingredient6 = params["strIngredient6"].stringValue
        ingredient7 = params["strIngredient7"].stringValue
        ingredient8 = params["strIngredient8"].stringValue
        ingredient9 = params["strIngredient9"].stringValue
        ingredient10 = params["strIngredient10"].stringValue
        ingredient11 = params["strIngredient11"].stringValue
        ingredient12 = params["strIngredient12"].stringValue
        ingredient13 = params["strIngredient13"].stringValue
        ingredient14 = params["strIngredient14"].stringValue
        ingredient15 = params["strIngredient15"].stringValue
        ingredient16 = params["strIngredient16"].stringValue
        ingredient17 = params["strIngredient17"].stringValue
        ingredient18 = params["strIngredient18"].stringValue
        ingredient19 = params["strIngredient19"].stringValue
        ingredient20 = params["strIngredient20"].stringValue

        measure1 = params["strMeasure1"].stringValue
        measure2 = params["strMeasure2"].stringValue
        measure3 = params["strMeasure3"].stringValue
        measure4 = params["strMeasure4"].stringValue
        measure5 = params["strMeasure5"].stringValue
        measure6 = params["strMeasure6"].stringValue
        measure7 = params["strMeasure7"].stringValue
        measure8 = params["strMeasure8"].stringValue
        measure9 = params["strMeasure9"].stringValue
        measure10 = params["strMeasure10"].stringValue
        measure11 = params["strMeasure11"].stringValue
        measure12 = params["strMeasure12"].stringValue
        measure13 = params["strMeasure13"].stringValue
        measure14 = params["strMeasure14"].stringValue
        measure15 = params["strMeasure15"].stringValue
        measure16 = params["strMeasure16"].stringValue
        measure17 = params["strMeasure17"].stringValue
        measure18 = params["strMeasure18"].stringValue
        measure19 = params["strMeasure19"].stringValue
        measure20 = params["strMeasure20"].stringValue

    }
}
