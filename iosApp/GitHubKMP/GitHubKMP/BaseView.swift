//
//  BaseView.swift
//  GitHubKMP
//
//  Created by Daniel Reyes Sánchez on 5/19/19.
//  Copyright © 2019 Robert Bosch. All rights reserved.
//

import shared
import UIKit

extension UIViewController: BaseView {
    
    public func showError(error: KotlinThrowable) {
        let title: String = "Error"
        var errorMessage: String? = nil
        
        switch error {
        case is UpdateProblem:
            errorMessage = "Failed to get data from server, please check your internet connection"
        default:
            errorMessage = "Unknown error"
        }
        
        if let message = errorMessage {
            self.showError(title: title, message: message)
        }
    }
    
    func showError(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
