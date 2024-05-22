//
//  AppUtility.swift
//  iOS_RecipeApp
//
//  Created by Hardik on 08/10/23.
//

import Foundation
import UIKit
import SVProgressHUD

class AppUtility{
    static let shared = AppUtility()
    
    //MARK: - Show Alert
    func showAlert(viewController: UIViewController, alertTitle: String, alertMsg: String, actionTitle: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel))
        if let topViewController = UIApplication.topViewController() {
            topViewController.present(alert, animated: true)
        }
    }
    
    //MARK: - Show-Hide Progress Indicator
    func showProgressHud() {
        SVProgressHUD.show()
    }
    
    func dismissProgressHud() {
        SVProgressHUD.dismiss()
    }
}
