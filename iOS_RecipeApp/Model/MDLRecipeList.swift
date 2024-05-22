//
//  MDLRecipeList.swift
//  iOS_RecipeApp
//
//  Created by Hardik on 08/10/23.
//

import Foundation
import SwiftyJSON

struct MDLRecipeList {
    
    var recipeName = ""
    var recipeImage = ""
    var recipeID = 0
    
    init(params: JSON) {
        
        recipeName = params["strMeal"].stringValue
        recipeImage = params["strMealThumb"].stringValue
        recipeID = params["idMeal"].intValue
    }
}
