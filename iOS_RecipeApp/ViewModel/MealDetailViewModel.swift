//
//  MealDetailViewModel.swift
//  iOS_RecipeApp
//
//  Created by Hardik on 08/10/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class MealDetailViewModel{
    func fetchRecipeDetails(recipeID: Int, completion: @escaping (Bool, MDLRecipeDetails?) -> Void) {
        if CheckInternetAvailabilty().isConnectedToNetwork() {
            AppUtility.shared.showProgressHud()
            self.fetchMealDetailsFromApi(mealID: recipeID) { [weak self] (isSuccess, recipeDetail) in
                guard self != nil else { return }
                AppUtility.shared.dismissProgressHud()

                if isSuccess, let model = recipeDetail {
                    completion(true, model)
                } else {
                    completion(false, nil)
                }
            }
        } else {
            AppUtility.shared.dismissProgressHud()
            completion(false, nil)
        }
    }

    func fetchMealDetailsFromApi(mealID: Int, _ completion: @escaping (Bool, MDLRecipeDetails?) -> Void) {
        
        let apiURL = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        
        AF.request(apiURL, method: .get).response { [weak self] (response) in
            guard self != nil else { return }
            
            switch response.result {
            case .success:
                let dataResult = JSON(response.value as Any)
                let arrMealDetails = dataResult["meals"].arrayValue.map({MDLRecipeDetails(params: $0)})
                completion(true, arrMealDetails[0])
            case .failure(let error):
                print(error)
                completion(false, nil)
            }
        }
    }
}
