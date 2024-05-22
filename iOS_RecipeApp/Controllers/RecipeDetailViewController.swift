import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lblRecipeDescription: UILabel!
    @IBOutlet weak var lblRecipeName: UILabel!
    @IBOutlet weak var imgVRecipe: UIImageView!
    @IBOutlet weak var viewInstructions: UIView!
    @IBOutlet weak var viewIngrediants: UIView!
    @IBOutlet weak var lblInstructions: UILabel!
    @IBOutlet weak var lblIngrediants: UILabel!
    
    var recipeID: Int?
    let recipeVM = MealDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    
    private func initialization() {
        self.viewMain.isHidden = true
        viewIngrediants.layer.cornerRadius = 5.0
        viewInstructions.layer.cornerRadius = 5.0
        imgVRecipe.layer.cornerRadius = 5.0
        self.fetchRecipeDetailsFromApi(recipeID: recipeID ?? 0)
    }
}


//MARK: - Api Call and set up UI

extension RecipeDetailViewController {
    
    private func fetchRecipeDetailsFromApi(recipeID: Int) {
        recipeVM.fetchRecipeDetails(recipeID: recipeID) { [weak self] (isSuccess, recipeDetail) in
            guard let self = self else { return }

            if isSuccess, let model = recipeDetail {
                self.setUPUI(recipeDetail: model)
            } else {
                AppUtility.shared.showAlert(viewController: self, alertTitle: "Oh No!", alertMsg: "Something went wrong, Please try again later", actionTitle: "OK")
            }
        }
    }

    private func setUPUI(recipeDetail:MDLRecipeDetails?) {
        
        self.viewMain.isHidden = false
        lblRecipeDescription.text = "You can see recipe of \(recipeDetail?.recipeName ?? "") from here."
        lblRecipeName.text = recipeDetail?.recipeName
        imgVRecipe.setImageFromStringrURL(stringUrl: recipeDetail?.recipeImage ?? "")
        lblInstructions.text = recipeDetail?.recipeInstruction
        
        let strIngrediants = "\(recipeDetail?.ingredient1 ?? ""): \(recipeDetail?.measure1 ?? "")\n\(recipeDetail?.ingredient2 ?? ""): \(recipeDetail?.measure2 ?? "")\n\(recipeDetail?.ingredient3 ?? ""): \(recipeDetail?.measure3 ?? "")\n\(recipeDetail?.ingredient4 ?? ""): \(recipeDetail?.measure4 ?? "")\n\(recipeDetail?.ingredient5 ?? ""): \(recipeDetail?.measure5 ?? "")\n\(recipeDetail?.ingredient6 ?? ""): \(recipeDetail?.measure6 ?? "")\n\(recipeDetail?.ingredient7 ?? ""): \(recipeDetail?.measure7 ?? "")\n\(recipeDetail?.ingredient8 ?? ""): \(recipeDetail?.measure8 ?? "")\n\(recipeDetail?.ingredient9 ?? ""): \(recipeDetail?.measure9 ?? "")\n\(recipeDetail?.ingredient10 ?? ""): \(recipeDetail?.measure10 ?? "")\(recipeDetail?.ingredient11 ?? ""): \(recipeDetail?.measure11 ?? "")\n\(recipeDetail?.ingredient12 ?? ""): \(recipeDetail?.measure12 ?? "")\n\(recipeDetail?.ingredient13 ?? ""): \(recipeDetail?.measure13 ?? "")\n\(recipeDetail?.ingredient14 ?? ""): \(recipeDetail?.measure14 ?? "")\n\(recipeDetail?.ingredient15 ?? ""): \(recipeDetail?.measure15 ?? "")\n\(recipeDetail?.ingredient16 ?? ""): \(recipeDetail?.measure16 ?? "")\n\(recipeDetail?.ingredient17 ?? ""): \(recipeDetail?.measure17 ?? "")\n\(recipeDetail?.ingredient18 ?? ""): \(recipeDetail?.measure18 ?? "")\n\(recipeDetail?.ingredient19 ?? ""): \(recipeDetail?.measure19 ?? "")\n\(recipeDetail?.ingredient20 ?? ""): \(recipeDetail?.measure20 ?? "")"
        
        let strFilteredIngrediants = strIngrediants.replacingOccurrences(of: "\n:", with: "", options: NSString.CompareOptions.literal, range: nil)
        lblIngrediants.text = strFilteredIngrediants
    }
}
