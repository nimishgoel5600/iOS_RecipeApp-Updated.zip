//
//  MealViewModel.swift
//  iOS_RecipeApp
//
//  Created by Hardik on 08/10/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class MealViewModel{
    var arrayRecipeList = [MDLRecipeList]()

    func fetchRecipeData(completion: @escaping (Bool) -> Void) {
        AppUtility.shared.showProgressHud()

        if CheckInternetAvailabilty().isConnectedToNetwork() {
            fetchMealListFromApi { [weak self] (isSuccess) in
                guard self != nil else { return }

                if isSuccess {
                    AppUtility.shared.dismissProgressHud()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        completion(true)
                    }
                } else {
                    AppUtility.shared.dismissProgressHud()
                    completion(false)
                }
            }
        } else {
            AppUtility.shared.dismissProgressHud()
            completion(false)
        }
    }
    
    func fetchMealListFromApi( _ completion: @escaping (Bool) -> Void) {
        
        let apiURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        AF.request(apiURL, method: .get).response { [weak self] (response) in
            guard let self else { return }
            
            switch response.result {
                
            case .success:
                
                let dataResult = JSON(response.value as Any)
                arrayRecipeList = dataResult["meals"].arrayValue.map({MDLRecipeList.init(params: $0)})
                
                var tempArrRecipeList = arrayRecipeList
                
                for i in 0..<arrayRecipeList.count {
                    if arrayRecipeList[i].recipeID == 0 || arrayRecipeList[i].recipeName == "" || arrayRecipeList[i].recipeImage == "" {
                        tempArrRecipeList.remove(at: i)
                    }
                }
                arrayRecipeList = tempArrRecipeList
                
                let sortedRecipes = arrayRecipeList.sorted(by: {$0.recipeName < $1.recipeName})
                arrayRecipeList = sortedRecipes
                
                completion(true)
                
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }

}
