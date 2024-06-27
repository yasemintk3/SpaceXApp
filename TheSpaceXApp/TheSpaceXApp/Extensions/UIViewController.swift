//
//  UIViewController.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 27.06.2024.
//

import UIKit

extension UIViewController {
    
    private enum Constant {
        static let errorTitle = "Error"
        static let okButtonTitle = "OK"
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: Constant.errorTitle,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: Constant.okButtonTitle, style: .default) { UIAlertAction in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
