import UIKit
import SVProgressHUD

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var tblVRecipeList: UITableView!
    @IBOutlet weak var lblDescription: UILabel!
    
    let recipeVM = MealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialization()
        
    }
    
    private func initialization() {
        
        tblVRecipeList.delegate = self
        tblVRecipeList.dataSource = self
        tblVRecipeList.register(UINib(nibName: "RecipeTblVCell", bundle: nil), forCellReuseIdentifier: "RecipeTblVCell")
        lblDescription.isHidden = true
        tblVRecipeList.isHidden = true
        fetchRecipeDataFromApi()
    }
}

//MARK: - Api Call

extension RecipeListViewController {
    
    private func fetchRecipeDataFromApi() {
        recipeVM.fetchRecipeData { [weak self] (isSuccess) in
            guard let self = self else { return }
            if isSuccess {
                lblDescription.isHidden = false
                tblVRecipeList.isHidden = false
                self.tblVRecipeList.reloadData()
            } else {
                AppUtility.shared.showAlert(viewController: self, alertTitle: "Oh No!", alertMsg: "Something went wrong, Please try again later", actionTitle: "OK")
            }
        }
    }
}

//MARK: - TableView Delegate and dataSource Methods

extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeVM.arrayRecipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTblVCell") as? RecipeTblVCell {
            cell.displayRecipeData(data: recipeVM.arrayRecipeList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipeDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeDetailViewController") as! RecipeDetailViewController
        recipeDetailVC.recipeID = recipeVM.arrayRecipeList[indexPath.row].recipeID
        self.navigationController?.pushViewController(recipeDetailVC, animated: true)
    }
}

